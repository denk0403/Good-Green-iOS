//
//  AppServiceRealData.swift
//  Good Green
//
//  Created by Jack Rosen on 2/8/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class AppServiceRealData: AppService {
	private var authToken: String? = "9gYFzFWl1t+P+kd67HzCS5N1A1Lwj4BvvtGFi/C/sbk="
	
	private var challenges: [Challenge] = []
	private var progresses: [Progress] = []
	private var users: [User] = []
	
	private var cancellables: Set<AnyCancellable> = []
	
	private var baseURL = "http://localhost:8080"
	
	func makeGetApiRequest<T: Decodable>(url: String, extraArguments: String = "", completion: @escaping (T?) -> ()) {
		var request = URLRequest(url: URL(string: "\(baseURL)\(url)?auth=\(authToken!)\(extraArguments)")!)
		request.httpMethod = "GET"
		URLSession.shared.dataTask(with: request) {(data, _, error) in
			guard error == nil else {
				completion(nil)
				return
			}
			
			guard let myData = data else {
				completion(nil)
				return
			}
			
			completion(try? JSONDecoder().decode(T.self, from: myData))
		}.resume()
	}
	
	func makePostApiRequest<T: Decodable>(url: String, extraArguments: [String: String] = [:], completion: @escaping (T?) -> ()) {
		var request = URLRequest(url: URL(string: "\(baseURL)\(url)")!)
		request.httpMethod = "POST"
		extraArguments.forEach({request.setValue($0.key, forHTTPHeaderField: $0.value)})
		request.setValue(self.authToken!, forHTTPHeaderField: "auth")
		URLSession.shared.dataTask(with: request) {(data, _, error) in
			guard error == nil else {
				completion(nil)
				return
			}
			
			guard let myData = data else {
				completion(nil)
				return
			}
			
			completion(try? JSONDecoder().decode(T.self, from: myData))
		}.resume()
	}
	
	func makePostApiRequestBool(url: String, extraArguments: [String: String] = [:], completion: @escaping (Bool) -> ()) {
		var request = URLRequest(url: URL(string: "\(baseURL)\(url)")!)
		request.httpMethod = "POST"
		extraArguments.forEach({request.setValue($0.key, forHTTPHeaderField: $0.value)})
		request.setValue(self.authToken!, forHTTPHeaderField: "auth")
		URLSession.shared.dataTask(with: request) {(data, _, error) in
			completion(error != nil && (try? JSONSerialization.jsonObject(with: data ?? Data(), options: .allowFragments) as? [String: Any])?["error"] != nil)
		}.resume()
	}
	
	func getChallenge(challengeID: String, callback: @escaping (Challenge?) -> Void) {
		self.getChallenge(challengeID: challengeID, cache: false, callback: callback)
	}
	
	func getChallenge(challengeID: String, cache: Bool, callback: @escaping (Challenge?) -> Void) {
		if cache, let value = challenges.first(where: {$0.id == challengeID}) {
			callback(value)
			return
		}
		self.makeGetApiRequest(url: "/challenge/\(challengeID)") { (challenge: ChallengeDTO?) in
			guard let actualChallenge = challenge else {
				callback(nil)
				return
			}
			
			self.parse(challengeDTO: actualChallenge) {
				guard let finish = $0 else {
					callback(nil)
					return
				}
				self.challenges.append(finish)
				callback(finish)
			}
		}
	}
	
	
	func parse(challengeDTO actualChallenge: ChallengeDTO, callback: @escaping (Challenge?) -> ()) {
		self.getUserArray(actualChallenge.challengeUsers) { outsideUsers in
			guard let users = outsideUsers else {
				callback(nil)
				return
			}
			self.getUser(userID: actualChallenge.creator) {user in
				if let actualUser = user {
					callback(Challenge(id: actualChallenge.id, name: actualChallenge.name, iconImage: Image(actualChallenge.iconImage), vibe: actualChallenge.vibe, description: actualChallenge.description, threshold: actualChallenge.threshold, creator: actualUser, challengeUsers: users))
					return
				}
				callback(nil)
			}
			
		}
	}
	
	func getUserChallenges(with url: String, callback: @escaping ([Progress]?) -> Void) {
		self.makeGetApiRequest(url: url) {(progress: [ProgressDTO]?) in
			guard let actualProgress = progress else {
				callback(nil)
				return
			}
			let semaphore = DispatchSemaphore(value: 1)
			
			var progresses = [Progress]()
			var hasError = false
			for each in actualProgress where !hasError{
				self.getChallenge(challengeID: each.challenge) {
					guard let challenge = $0 else {
						callback(nil)
						hasError = true
						semaphore.signal()
						return
					}
					progresses.append(Progress(value: each.value, threshold: each.threshold,challenge: challenge))
					semaphore.signal()
				}
				semaphore.wait()
			}
			callback(progresses)
		}
	}
	func getUserActiveChallenges(callback: @escaping ([Progress]?) -> Void ) {
		self.getUserChallenges(with: "/active/challenge", callback: callback)
	}
	func getUserPreviousChallenges(callback: @escaping ([Progress]?) -> Void) {
		self.getUserChallenges(with: "/previous/challenge", callback: callback)
	}
	
	func getUser(userID: String, callback: @escaping (User?) -> Void) {
		self.getUser(userID: userID, getFollowers: true, completion: callback)
	}
	
	func getUser(userID: String, getFollowers: Bool, completion: @escaping (User?) -> Void) {
		if let user = self.users.last(where: {$0.id == userID}), !getFollowers{
			completion(user)
			return
		}
		self.makeGetApiRequest(url: "/user/\(userID)") {(userDTO: UserDTO?) in
			guard let user = userDTO else {
				completion(nil)
				return
			}
			self.parse(user: user, getFollowers: getFollowers, completion: completion)
		}
	}
	
	func parse(user: UserDTO, getFollowers: Bool, completion: @escaping (User?) -> ()) {
		if !getFollowers {
			let doneUser = User(userImage: Image(user.userImage), id: user.id, name: user.name, bio: user.bio)
			self.users.append(doneUser)
			completion(doneUser)
			return
		}
		
		self.getUserArray(user.following, followers: false) { bigUsers in
			guard let users = bigUsers else {
				completion(nil)
				return
			}
			let finishedUser = User(userImage: Image(user.userImage), id: user.id, name: user.name, bio: user.bio, activeChallenges: [], previousChallenges: [], followers: [], following: users)
			self.users.append(finishedUser)
			completion(finishedUser)
		}
		
	}
	
	func getUserArray(_ arr: [String], followers: Bool = true, callback: @escaping ([User]?) -> ()) {
		let myGroup = DispatchGroup()
		
		var users: [User] = []
		
		for user in arr {
			myGroup.enter()
			self.getUser(userID: user, getFollowers: followers) {
				if let myUser = $0 {
					users.append(myUser)
				}
				myGroup.leave()
			}
		}
		myGroup.notify(queue: .main) {
			callback(users.count == arr.count ? users : nil)
		}
	}
	
	func authUser(username: String, password: String, callback: @escaping (User?) -> Void) {
		self.makePostApiRequest(url: "/auth/token") { (auth: Authentication?) in
			guard let authentication = auth else {
				callback(nil)
				return
			}
			self.authToken = authentication.key
			self.parse(user: authentication.value, getFollowers: true, completion: callback)
		}
	}
	
	func getFeed(offset: Int, callback: @escaping ([FeedObject]?) -> Void) {
		self.makeGetApiRequest(url: "/feed") {(fdto: [FeedObjectDTO]?) in
			guard let actualObjects = fdto else {
				callback(nil)
				return
			}
			let dispatchGroup = DispatchGroup()
			var objects = [FeedObject]()
			for object in actualObjects {
				dispatchGroup.enter()
				self.createFeedObject(from: object) {
					if let object = $0 {
						objects.append(object)
					}
					dispatchGroup.leave()
				}
			}
			dispatchGroup.notify(queue: .main) {
				callback(objects)
			}
		}
	}
	
	func createFeedObject(from dto: FeedObjectDTO, callback: @escaping (FeedObject?) -> ()) {
		var feedObject: FeedObject?
		self.getChallenge(challengeID: dto.challengeId) { challenge in
			self.getUser(userID: dto.creator, getFollowers: false) {user in
				self.getUserArray(dto.likes){ users in
					if let actualChallenge = challenge, let actualUser = user {
						feedObject = FeedObject(id: dto.id, user: actualUser, challenge: actualChallenge, likes: users ?? [], feedType: dto.feedType ?? FeedType.created, date: dto.date.toISODate() ?? Date())
						callback(feedObject)
					} else {
						callback(nil)
					}
				}
			}
		}
	}
	
	func getProgress(challengeID: String, userID: String, callback: @escaping (Progress?) -> Void) {
		callback(nil)
	}
	
	func getUsers(query: String, callback: @escaping ([User]?) -> Void) {
		self.makeGetApiRequest(url: "/search/user", extraArguments: "&q=\(query)") { (users: [UserDTO]?) in
			guard let userArray = users else {
				callback(nil)
				return
			}
			let semaphore = DispatchSemaphore(value: 0)
			var finishedUsers = [User]()
			for user in userArray {
				self.parse(user: user, getFollowers: false) {
					if let val = $0 {
						finishedUsers.append(val)
					}
					semaphore.signal()
				}
				semaphore.wait()
			}
			callback(finishedUsers)
		}
	}
	
	func createChallenge(name: String, description: String, vibe: Vibe, icon: Image, callback: @escaping (Challenge?) -> Void) {
		self.makePostApiRequest(url: "/challenge/create", extraArguments: ["id": name, "icon": "house", "vibe": vibe.toString(), "description": description, "threshold": "1"]) {(challenge: ChallengeDTO?) in
			if let actualChallenge = challenge {
				self.parse(challengeDTO: actualChallenge) {
					 if let nonDTO = $0 {
						self.challenges.append(nonDTO)
						callback(nonDTO)
						return
					}
					callback(nil)
				}
			} else {
				callback(nil)
			}
		}
	}
	
	func acceptChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/challenge/\(challengeID)/accept", completion: callback)
	}
	
	func dropChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/challenge/\(challengeID)/drop", completion: callback)
	}
	
	func completeChallenge(challengeID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/challenge/\(challengeID)/complete", completion: callback)
	}
	
	func likePost(feedID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/feedID/\(feedID)/unlike", completion: callback)
	}
	
	func unlikePost(feedID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/feedID/\(feedID)/like", completion: callback)
	}
	
	func followUser(userID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/user/\(userID)/follow", completion: callback)
	}
	
	func unfollowUser(userID: String, callback: @escaping (Bool) -> Void) {
		self.makePostApiRequestBool(url: "/user/\(userID)/unfollow", completion: callback)
	}
    
    func searchChallenges(query: String, callback: @escaping ([Challenge]?) -> Void) {
		self.makeGetApiRequest(url: "/search/challenge") {(challenges: [ChallengeDTO]?) in
			let challengePublishers = challenges?.map(self.getChallengePublisher(dto:))
			if let pubs = challengePublishers {
				pubs.dropFirst().reduce(pubs.first!, {
					return $0.merge(with: $1).eraseToAnyPublisher()
				}).collect(pubs.count)
				.sink(receiveValue: {
					callback($0.compactMap({tr in tr}))
				}).store(in: &self.cancellables)
			} else {
				callback(nil)
			}
			
		}
    }
	
	func getChallengePublisher(dto: ChallengeDTO) -> AnyPublisher<Challenge?, Never> {
		let passthrough = PassthroughSubject<Challenge?, Never>()
		
		self.parse(challengeDTO: dto) {
			passthrough.send($0)
		}
		
		return passthrough.eraseToAnyPublisher()
	}
	
	func createUser(username: String, password: String, callback: @escaping (User?) -> ()) {
		self.makePostApiRequest(url: "/user/create", extraArguments: ["username": username, "password": password]) { (auth: Authentication?) in
			guard let authentication = auth else {
				callback(nil)
				return
			}
			self.authToken = authentication.key
			self.parse(user: authentication.value, getFollowers: true, completion: callback)
		}
	}
	
	func getUserFeed(userID: String, callback: @escaping ([FeedObject]?) -> ()) {
		self.makeGetApiRequest(url: "/feed/user/\(userID)") {(fdto: [FeedObjectDTO]?) in
			guard let actualObjects = fdto else {
				callback(nil)
				return
			}
			let dispatchGroup = DispatchGroup()
			var objects = [FeedObject]()
			for object in actualObjects {
				dispatchGroup.enter()
				self.createFeedObject(from: object) {
					if let object = $0 {
						objects.append(object)
					}
					dispatchGroup.leave()
				}
			}
			dispatchGroup.notify(queue: .main) {
				callback(objects)
			}
		}
	}
}

struct Authentication: Codable {
	let key: String
	let value: UserDTO
}

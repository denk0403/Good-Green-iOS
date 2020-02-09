//
//  ContentView.swift
//  Good Green
//
//  Created by Dennis Kats on 2/7/20.
//  Copyright © 2020 Dennis Kats. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection = 0
    init() {
        UITabBar.appearance().backgroundColor = Constants.whiteSmoke
        UINavigationBar.appearance().backgroundColor = Constants.whiteSmoke
        
               UINavigationBar.appearance().largeTitleTextAttributes = [
                .foregroundColor: Constants.gunmetal,
             .font : UIFont(name:"Helvetica Neue", size: 40)!]
    }
 
    var body: some View {
        NavigationView {
            
        TabView(selection: $selection) {
            FeedView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "line.horizontal.3")
                        Text("Feed")
                    }
                }
                .tag(0)
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
        
            HomeView(user: Constants.user1)
                .tabItem{
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
            }.tag(2)
        }
		.navigationBarTitle(Text(""), displayMode: .inline)
		}.environment(\.appService, AppServiceImpl())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Key: EnvironmentKey {
	static let defaultValue: AppService = AppServiceImpl()
}


extension EnvironmentValues {
    var appService: AppService {
        get {
            return self[Key.self]
        }
        set {
            self[Key.self] = newValue
        }
    }
}

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
        UITabBar.appearance().backgroundColor = UIColor.blue
    }
 
    var body: some View {
        TabView(selection: $selection){
            Text("Feed")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "line.horizontal.3")
                        Text("First")
                    }
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
                .tag(1)
        
            Text("Third View")
                .font(.title)
                .tabItem{
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                .tag(2)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

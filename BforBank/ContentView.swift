//
//  ContentView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AccountView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Comptes")
                }.tag(0)

            TransactionView()
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Virements")
                }.tag(1)
            
            HelpView()
                .tabItem {
                    Image(systemName: "square.fill")
                    Text("Aide")
                }.tag(2)
            
            MoreView()
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Plus")
                }.tag(3)
        }.onAppear {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            
            UITabBar.appearance().standardAppearance = appearance
            UITabBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

#Preview {
    ContentView()
}

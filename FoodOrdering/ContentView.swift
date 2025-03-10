//
//  ContentView.swift
//  FoodOrdering
//
//  Created by AlexX on 2025-03-10.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(0)
            
            OrdersView()
                .tabItem {
                    Label("Orders", systemImage: "bag")
                }
                .tag(1)
            
            CartView()
                .tabItem {
                    Label("Cart", systemImage: "cart")
                }
                .tag(2)
            
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(3)
        }
        .accentColor(Color("PrimaryColor"))
    }
}

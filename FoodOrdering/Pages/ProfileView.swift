//
//  ProfileView.swift
//  FoodOrdering
//
//  Created by AlexX on 2025-03-10.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.secondary)
                    .padding()
                
                Text("User Profile")
                    .font(.headline)
                
                // Add profile details here
            }
            .navigationTitle("Profile")
        }
    }
}

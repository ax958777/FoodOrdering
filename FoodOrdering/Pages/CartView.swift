//
//  CartView.swift
//  FoodOrdering
//
//  Created by AlexX on 2025-03-10.
//

import SwiftUI

struct CartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Cart")
                    .font(.headline)
                Text("Your cart is empty")
                    .foregroundColor(.secondary)
                    .padding()
            }
            .navigationTitle("Cart")
        }
    }
}

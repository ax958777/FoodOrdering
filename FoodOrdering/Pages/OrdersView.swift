//
//  OrdersView.swift
//  FoodOrdering
//
//  Created by AlexX on 2025-03-10.
//

import SwiftUI

struct OrdersView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Your Orders")
                    .font(.headline)
                Text("You have no recent orders")
                    .foregroundColor(.secondary)
                    .padding()
            }
            .navigationTitle("Orders")
        }
    }
}

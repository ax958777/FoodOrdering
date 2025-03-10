//
//  Model.swift
//  FoodOrdering
//
//  Created by AlexX on 2025-03-10.
//
import SwiftUI

struct FoodCategory: Identifiable {
    let id = UUID()
    let name: String
    let iconName: String
}

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let rating: Double
    let deliveryTime: Int
    let deliveryFee: Int
    let tags: [String]
    let imageName: String
}

struct MenuCategory: Identifiable {
    let id = UUID()
    let name: String
    let items: [MenuItem]
}

struct MenuItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let imageName: String
}

// MARK: - Sample Data
let foodCategories = [
    FoodCategory(name: "All", iconName: "square.grid.2x2"),
    FoodCategory(name: "Pizza", iconName: "circle.fill"),
    FoodCategory(name: "Burger", iconName: "circle.fill"),
    FoodCategory(name: "Sushi", iconName: "circle.fill"),
    FoodCategory(name: "Italian", iconName: "circle.fill"),
    FoodCategory(name: "Chinese", iconName: "circle.fill")
]

let sampleRestaurants = [
    Restaurant(name: "Burger Palace", rating: 4.8, deliveryTime: 25, deliveryFee: 5, tags: ["Burgers", "American"], imageName: "restaurant1"),
    Restaurant(name: "Pasta Paradise", rating: 4.6, deliveryTime: 30, deliveryFee: 4, tags: ["Italian", "Pasta"], imageName: "restaurant2"),
    Restaurant(name: "Sushi Sensation", rating: 4.9, deliveryTime: 20, deliveryFee: 6, tags: ["Japanese", "Sushi"], imageName: "restaurant3")
]

let menuCategories = [
    MenuCategory(name: "Popular Items", items: [
        MenuItem(name: "Classic Burger", description: "Beef patty, lettuce, tomato, special sauce", price: 8.99, imageName: "burger1"),
        MenuItem(name: "Cheese Burger", description: "Beef patty, cheddar cheese, pickles, onions", price: 9.99, imageName: "burger2"),
        MenuItem(name: "Bacon Burger", description: "Beef patty, bacon, lettuce, tomato, mayo", price: 10.99, imageName: "burger3")
    ]),
    MenuCategory(name: "Sides", items: [
        MenuItem(name: "French Fries", description: "Crispy golden fries with sea salt", price: 3.99, imageName: "fries"),
        MenuItem(name: "Onion Rings", description: "Crispy battered onion rings", price: 4.99, imageName: "onionrings")
    ])
]

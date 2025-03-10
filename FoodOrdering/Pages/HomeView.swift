//
//  HomeView.swift
//  FoodOrdering
//
//  Created by AlexX on 2025-03-10.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedRestaurant: Restaurant?
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Search Bar
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        
                        TextField("Search for restaurants or dishes", text: $searchText)
                            .font(.system(size: 16))
                        
                        if !searchText.isEmpty {
                            Button(action: {
                                searchText = ""
                            }) {
                                Image(systemName: "xmark.circle.fill")
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                    .padding(.horizontal)
                    
                    // Categories
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(foodCategories) { category in
                                CategoryItem(category: category)
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                    // Promotional Banner
                    PromotionBanner()
                        .padding(.horizontal)
                    
                    // Nearby Restaurants
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Nearby Restaurants")
                                .font(.title3)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Button("View All") {
                                // Action to view all restaurants
                            }
                            .foregroundColor(Color("PrimaryColor"))
                            .font(.subheadline)
                        }
                        .padding(.horizontal)
                        
                        // Restaurant List
                        VStack(spacing: 16) {
                            ForEach(sampleRestaurants) { restaurant in
                                Button(action: {
                                    selectedRestaurant = restaurant
                                }) {
                                    RestaurantCard(restaurant: restaurant)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
                .padding(.vertical)
            }
            .navigationTitle("Home")
            .navigationBarItems(trailing:
                Button(action: {
                    // Profile action
                }) {
                    Image(systemName: "person.circle")
                        .font(.system(size: 22))
                }
            )
            .sheet(item: $selectedRestaurant) { restaurant in
                RestaurantDetailView(restaurant: restaurant)
            }
        }
    }
}

struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    let restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                // Header Image
                ZStack(alignment: .topLeading) {
                    Image(restaurant.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 200)
                        .clipped()
                    
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                            .padding(10)
                            .background(Color.black.opacity(0.6))
                            .clipShape(Circle())
                    }
                    .padding(16)
                }
                
                // Restaurant Info
                VStack(alignment: .leading, spacing: 8) {
                    Text(restaurant.name)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    HStack(spacing: 12) {
                        Label("\(restaurant.rating)", systemImage: "star.fill")
                            .foregroundColor(.secondary)
                        
                        Text("\(restaurant.deliveryTime) min")
                            .foregroundColor(.secondary)
                        
                        Text("$\(restaurant.deliveryFee) delivery")
                            .foregroundColor(.secondary)
                    }
                    .font(.subheadline)
                }
                .padding()
                
                Divider()
                
                // Menu Categories
                ForEach(menuCategories) { category in
                    MenuCategoryView(category: category)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

// MARK: - Supporting Views
struct CategoryItem: View {
    let category: FoodCategory
    
    var body: some View {
        VStack {
            Image(systemName: category.iconName)
                .font(.system(size: 24))
                .foregroundColor(Color("PrimaryColor"))
                .frame(width: 60, height: 60)
                .background(Color(.systemGray6))
                .clipShape(Circle())
            
            Text(category.name)
                .font(.caption)
                .foregroundColor(.primary)
        }
    }
}

struct PromotionBanner: View {
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color("PrimaryColor"))
                .frame(height: 160)
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    Text("50% OFF")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("On your first order")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.9))
                    
                    Button(action: {
                        // Order now action
                    }) {
                        Text("Order Now")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("PrimaryColor"))
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color.white)
                            .cornerRadius(16)
                    }
                    .padding(.top, 4)
                }
                .padding(.leading, 16)
                
                Spacer()
                
                Image("promotion_food")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 140)
            }
        }
    }
}

struct RestaurantCard: View {
    let restaurant: Restaurant
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(restaurant.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 140)
                .clipped()
                .cornerRadius(12, corners: [.topLeft, .topRight])
            
            VStack(alignment: .leading, spacing: 4) {
                Text(restaurant.name)
                    .font(.headline)
                
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("\(restaurant.rating)")
                    
                    Text("•")
                    
                    Text("\(restaurant.deliveryTime) min")
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                HStack {
                    ForEach(restaurant.tags, id: \.self) { tag in
                        Text(tag)
                            .font(.caption)
                            .foregroundColor(.secondary)
                            .padding(.horizontal, 8)
                            .padding(.vertical, 4)
                            .background(Color(.systemGray6))
                            .cornerRadius(4)
                    }
                }
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}

struct MenuCategoryView: View {
    let category: MenuCategory
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(category.name)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.horizontal)
                .padding(.top, 16)
            
            VStack(spacing: 16) {
                ForEach(category.items) { item in
                    HStack(spacing: 12) {
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(item.name)
                                .font(.headline)
                            
                            Text(item.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .lineLimit(2)
                            
                            Text("$\(item.price, specifier: "%.2f")")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            // Add to cart action
                        }) {
                            Image(systemName: "plus")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.white)
                                .frame(width: 24, height: 24)
                                .background(Color("PrimaryColor"))
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                }
            }
            
            Divider()
                .padding(.top, 8)
        }
    }
}

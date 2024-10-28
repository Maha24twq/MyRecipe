//
//  RecipeView.swift
//  Recipe
//
//  Created by Maha Salem Alghmadi on 25/04/1446 AH.
//
import SwiftUI

struct RecipeView: View {

    @State private var showAddRecipeSheet = false
    @StateObject private var recipeViewModel = RecipeViewModel()

    var body: some View {
        NavigationStack {
            if recipeViewModel.recipes.isEmpty {
                ZStack {
                    Circle()
                        .stroke(lineWidth: 30.0)
                        .foregroundColor(Color("RecipeOrangi"))
                        .frame(width: 300, height: 300)
                    
                    Image(systemName: "fork.knife")
                        .foregroundColor(Color("RecipeOrangi"))
                        .font(.system(size: 160))
                }
                .padding(.bottom, 30)

                VStack {
                    Text("There is no recipe yet.")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Please add your recipe")
                        .padding(.top, 1)
                }
                .navigationTitle("Food Recipe")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddRecipe(recipeViewModel: recipeViewModel)) {
                            Image(systemName: "plus")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
                .toolbarBackground(.visible, for: .navigationBar)
            } else {
                List {
                    ForEach(recipeViewModel.recipes) { recipe in
                        ZStack(alignment: .bottomLeading) {
                            if let image = recipe.image {
                                
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, minHeight: 150)
                                    .clipped()
                            }
                            else {
                                
                                Rectangle()
                                
                                    .fill(.red)
                                    .scaledToFill()
                                    .frame(maxWidth: .infinity, minHeight: 150)
                                    //.clipped()
                            }
                                LinearGradient(
                                    gradient: Gradient(colors: [.black.opacity(0.6), .clear]),
                                    startPoint: .bottom,
                                    endPoint: .center
                                )
                                .frame(height: 300)
                            
                            
                            VStack(alignment: .leading) {
                                Text(recipe.name)
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding(.bottom, 2)
                                    .padding(.horizontal, 12)

                                Text(recipe.description)
                                    .font(.subheadline)
                                    .foregroundColor(.white.opacity(0.7))
                                    .padding(.horizontal, 12)
                            }
                            .padding()
                        }
                        .padding(.top, 10)
                        .listRowInsets(EdgeInsets())
                    }
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Food Recipe")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: AddRecipe(recipeViewModel: recipeViewModel)) {
                            Image(systemName: "plus")
                                .foregroundColor(.red)
                        }
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
    }
}

#Preview {
    RecipeView()
}


// Meal.swift
//
//  Meal.swift
//  lunchBox2
//
//  Created by Farah Almozaini on 14/04/1447 AH.
//
import Foundation
struct Meal: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let imageName: String
    let ingredients: [String]
    let instructions: [String]
}

enum SampleMeals {
    static let turkeySandwich = Meal(
        name: "Turkey Sandwich",
        imageName: "turkeySandwich",
        ingredients: [
            "2 slices whole-grain bread, toasted",
            "3–4 slices roasted turkey breast",
            "1 slice cheddar cheese (optional)",
            "1 leaf romaine lettuce",
            "2 slices tomato",
            "1 tbsp mayonnaise",
            "1 tsp mustard (optional)",
            "Salt & black pepper to taste"
        ],
        instructions: [
            "Toast the bread slices lightly until golden.",
            "Spread mayonnaise (and mustard if using) on one side of each slice.",
            "Place lettuce and tomato on the bottom slice, season lightly.",
            "Add turkey slices and cheese (if using).",
            "Top with the second slice of bread (mayo side down).",
            "Cut in half and serve with a side of salad or fries."
        ]
    )
}





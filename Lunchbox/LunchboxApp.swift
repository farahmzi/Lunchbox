// LunchBoxApp.swift
import SwiftUI
@main
struct LunchBoxApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeView(meal: SampleMeals.turkeySandwich)
        }
    }
}

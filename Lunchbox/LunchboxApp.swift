// LunchBoxApp.swift
import SwiftUI
@main
struct LunchBoxApp: App {
    var body: some Scene {
        WindowGroup {
            // أول شاشة يفتحها التطبيق
            RecipeView(meal: SampleMeals.turkeySandwich)
        }
    }
}

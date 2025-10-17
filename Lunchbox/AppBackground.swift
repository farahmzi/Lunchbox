///
//  AppBackground.swift
//  lunchBox2
//
//  Created by Farah Almozaini on 14/04/1447 AH.
//
// AppBackground.swift
import SwiftUI
struct AppBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 1.00, green: 0.95, blue: 0.80),
                Color(red: 1.00, green: 0.85, blue: 0.55),
                Color(red: 1.00, green: 0.75, blue: 0.40)
            ]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
        .overlay(
            RadialGradient(
                gradient: Gradient(colors: [
                    Color.white.opacity(0.4),
                    Color.clear
                ]),
                center: .topLeading,
                startRadius: 100,
                endRadius: 500
            )
            .blendMode(.softLight)
        )
    }
}



# 🥪 LunchBox

A beautiful SwiftUI recipe card application showcasing modern iOS development practices with clean, responsive design.

## 📱 Overview

The current implementation includes a classic Turkey Sandwich recipe, designed to work entirely offline, with easy extensibility for adding more meals through the `SampleMeals` enumeration.

* Decorative gradient background
* Meal image with recipe title
* List of required ingredients
* Numbered preparation steps
* Bookmark button for favorites
* "Done!" completion button

The current implementation includes a classic Turkey Sandwich recipe, with easy extensibility for adding more meals through the `SampleMeals` enumeration.

## ✨ Features

* **Modern SwiftUI Layouts**: Custom alignment and spacing for clean, readable card design  
* **Gradient Background**: Multi-stop linear and radial gradients for a warm, inviting appearance  
* **Dynamic Recipe Display**: Fully scrollable recipe view with all essential information  
* **Bookmark System**: Mark favorite recipes using `@State` property wrapper  
* **Responsive Design**: Layout constants ensure consistent UI across all device sizes with adaptive text scaling  
* **Offline Support**: Works seamlessly without an internet connection — all recipes are stored locally within the app

---

## 🎨 The Design

The main icon and user interface elements were thoughtfully designed to convey a soft, friendly, and approachable feel that complements the app’s overall tone.

<img width="1920" height="1080" alt="مشروع أبل الأول - 2025" src="https://github.com/user-attachments/assets/9d0ebb9b-1187-4828-94a0-4f2c6c2a824e" />

--
> And here is the final version of the icon as used in the app:

<img width="1024" height="1024" alt="appicon" src="https://github.com/user-attachments/assets/190604a8-d32c-4b04-8d54-4f946d348be1" />

## 📁 Project Structure

```
.
├── LunchBoxApp.swift       # Application entry point
├── AppBackground.swift     # Gradient background view
├── Meal.swift              # Meal data model
├── RecipeView.swift        # Main recipe card view
├── Assets.xcassets         # Image and asset catalog
└── SampleMeals.swift       # Sample meal definitions for preview/testing
```

### Key Components

* **`AppBackground`**: Applies multi-layer linear and radial gradients
* **`RecipeView`**: Primary view rendering the complete recipe card
* **`SectionHeader`, `BulletRow`, `NumberedRow`**: Reusable UI components for structured content

## 🚀 Getting Started

### Requirements

* macOS with Xcode 14 or later
* iOS 16.0 or later

### Setup

1. **Open in Xcode**
   * Double-click `LunchBox.xcodeproj` to open the project

2. **Run the app**
   * Select an iOS simulator or connected device
   * Press Run (⌘R) to build and launch

## 🍽️ Adding New Recipes

To add more recipes, define new `Meal` instances in `SampleMeals.swift`:

```swift
static let avocadoToast = Meal(
    name: "Avocado Toast",
    imageName: "avocadoToast",
    ingredients: [
        "1 slice whole-grain bread",
        "½ ripe avocado",
        "Pinch of salt",
        "Lemon juice"
    ],
    instructions: [
        "Toast the bread until golden brown.",
        "Mash the avocado with salt and lemon juice.",
        "Spread the mashed avocado on the toast.",
        "Enjoy immediately!"
    ]
)
```

> **Note**: Ensure you add the corresponding image to `Assets.xcassets` with a matching `imageName`.

## 🛠️ Technologies Used

* SwiftUI
* Swift
* MVVM Pattern


## 👨‍💻 Developer

Developed by [@farahmzi](https://github.com/farahmzi)


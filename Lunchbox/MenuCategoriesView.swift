//
//  MenuCategoriesView.swift
//  Lunchbox
//
//  Created by Farah Almozaini on 14/04/1447 AH.
//

import SwiftUI

// ********************************************************
// المُكونات المساعدة
// ********************************************************

struct FoodImageWithText: View {
    let titleImageName: String
    let foodImageName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            
            ZStack(alignment: .top) {
                
                // الدائرة المفرغة
                Circle()
                    .fill(Color.white.opacity(0.0))
                    .frame(width: 190, height: 190) // **تم زيادة حجم الدائرة هنا**
                    .overlay(Circle().stroke(Color.black, lineWidth: 1.6))
                
                // صورة الطعام
                Image(foodImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160, height: 160) // حجم الصورة الداخلية
                    .shadow(radius: 8, x: 0, y: 4)
                
                // صورة النص المقوس
                Image(titleImageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 110, height: 55)
                    .offset(y: -55) // **تم زيادة الإزاحة هنا لرفع النص أكثر فوق الدائرة الأكبر**
            }
        }
    }
}

struct DescriptionWithLine: View {
    let description: String
    let alignment: TextAlignment
    
    var body: some View {
        VStack(alignment: alignment == .leading ? .leading : .trailing) {
            
            // الخط الرفيع الرابط
            Rectangle()
                .fill(Color.gray.opacity(0.5))
                .frame(width: 50, height: 1)
                .offset(x: alignment == .leading ? 0 : -50, y: 0)
                .padding(.bottom, 5)

            Text(description)
                .font(.system(size: 12, weight: .regular, design: .default))
                .foregroundColor(.black)
                .multilineTextAlignment(alignment)
                .lineLimit(nil)
                .frame(width: 140)
        }
        .frame(maxHeight: .infinity)
    }
}

struct FoodItemContent: View {
    let titleImageName: String
    let foodImageName: String
    let description: String
    let isReversed: Bool
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            if isReversed {
                DescriptionWithLine(description: description, alignment: .trailing)
                FoodImageWithText(titleImageName: titleImageName, foodImageName: foodImageName)
            } else {
                FoodImageWithText(titleImageName: titleImageName, foodImageName: foodImageName)
                DescriptionWithLine(description: description, alignment: .leading)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct CategoryItemView<Destination: View>: View {
    let titleImageName: String
    let foodImageName: String
    let description: String
    let isReversed: Bool
    let destination: Destination

    var body: some View {
        NavigationLink(destination: destination) {
            HStack(alignment: .center, spacing: 5) {
                FoodItemContent(titleImageName: titleImageName, foodImageName: foodImageName, description: description, isReversed: isReversed)
            }
            .padding(.horizontal, 5)
        }
        .buttonStyle(PlainButtonStyle())
        .contentShape(Rectangle())
    }
}

// ********************************************************
// الواجهة الرئيسية للصفحة: MenuCategoriesView
// ********************************************************
struct MenuCategoriesView: View {
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                
                Image("bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 0) {
                        
                        CategoryItemView(
                            titleImageName: "burger_text_img",
                            foodImageName: "burger_img",
                            description: "A tasty mix of flavors from spiced fresh tuna to savory turkey and the classic club.",
                            isReversed: false,
                            destination: Text("صفحة تفاصيل البرجر (الربط لزميلتك)")
                        )
                        .padding(.vertical, 10)
                        .padding(.top, 30)
                        
                        CategoryItemView(
                            titleImageName: "pizza_text_img",
                            foodImageName: "pizza_img",
                            description: "A collection of fresh and flavorful pasta recipes, including Pesto, Marinara, and Fettuccine dishes.",
                            isReversed: true,
                            destination: Text("صفحة تفاصيل البيتزا (الربط لزميلتك)")
                        )
                        .padding(.vertical, 10)
                        
                        CategoryItemView(
                            titleImageName: "pasta_text_img",
                            foodImageName: "pasta_img",
                            description: "A collection of fresh and flavorful pasta recipes, including Pesto, Marinara, and Fettuccine dishes.",
                            isReversed: false,
                            destination: Text("صفحة تفاصيل الباستا (الربط لزميلتك)")
                        )
                        .padding(.vertical, 10)
                        
                        CategoryItemView(
                            titleImageName: "sandwich_text_img",
                            foodImageName: "sandwich_img",
                            description: "A tasty mix of flavors from spiced fresh tuna to savory turkey and the classic club.",
                            isReversed: true,
                            destination: Text("صفحة تفاصيل الساندويتش (الربط لزميلتك)")
                        )
                        .padding(.vertical, 10)
                        .padding(.bottom, 30)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    MenuCategoriesView()
}

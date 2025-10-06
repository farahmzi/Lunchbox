////  FavoriteView.swift
////  teeest
////
////  Created by رحاب فهد  on 14/04/1447 AH.
////
//
//import SwiftUI
//
//struct FavoriteView: View {
//    @EnvironmentObject var favoritesManager: FavoritesManager
//    
//    // متغيرات للتحكم بالمسافات
//    private let vStackSpacing: CGFloat = 100
//    private let scrollPadding: CGFloat = 1
//    private let emptyTextTopPadding: CGFloat = 1
//    private let titleTopPadding: CGFloat = 100
//    
//    var body: some View {
//        ZStack {
//            // الخلفية
//            Image("BG")
//                .resizable()
//                .scaledToFill()
//                .ignoresSafeArea()
//            
//            VStack {
//                // العنوان كـ Text
//                Text("FAVORITE")
//                    .font(.title)
//                    .fontWeight(.bold)
//                    .padding(.top, titleTopPadding)
//                
//                if favoritesManager.favorites.isEmpty {
//                    Spacer()
//                    Text("No favorites yet")
//                        .font(.title)
//                        .foregroundColor(.gray)
//                        .padding(.top, emptyTextTopPadding)
//                    Spacer()
//                } else {
//                    ScrollView {
//                        VStack(spacing: vStackSpacing) {
//                            ForEach(favoritesManager.favorites) { recipe in
//                                FavoriteCard(
//                                    leftImage: recipe.imageName,
//                                    title: recipe.title,
//                                    rightImage: recipe.imageName
//                                )
//                            }
//                        }
//                        .padding(scrollPadding)
//                    }
//                }
//            }
//        }
//    }
//}
//
//
//// بطاقة كل وصفة
//struct FavoriteCard: View {
//    var leftImage: String
//    var title: String
//    var rightImage: String
//    
//    var body: some View {
//        HStack {
//            Image(leftImage)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50, height: 50)
//            
//            VStack(alignment: .leading, spacing: 4) {
//                Text("RECIPE")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//                Text(title)
//                    .font(.headline)
//                    .foregroundColor(.black)
//            }
//            
//            Spacer()
//            
//            Image(rightImage)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50, height: 50)
//        }
//        .padding()
//        .background(Color.white.opacity(0.9))
//        .cornerRadius(15)
//        .shadow(radius: 2)
//    }
//}
//#Preview {
//    FavoriteView()
//        .environmentObject(FavoritesManager())
//}
//
//

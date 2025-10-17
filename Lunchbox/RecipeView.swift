// RecipeView.swift
import SwiftUI

private enum Layout {
    static let cardCorner: CGFloat     = 24
    static let cardHPad: CGFloat       = 24
    static let cardVPad: CGFloat       = 20
    static let sectionSpacing: CGFloat = 20
    static let listRowSpacing: CGFloat = 10
    static let maxContentWidth: CGFloat = 700
    static let doneButtonHeight: CGFloat = 60
    static let doneButtonHPad: CGFloat = 30
    static let doneButtonVPad: CGFloat = 20
    static let imageSize: CGFloat = 160
    static let imageRise: CGFloat = 56
}

struct RecipeView: View {
    let meal: Meal
    @State private var isBookmarked = false

    var body: some View {
        ZStack {
            AppBackground()

            ScrollView(.vertical) {
                VStack(spacing: 24) {
                    Spacer().frame(height: 12)

                    VStack(alignment: .leading, spacing: Layout.sectionSpacing) {
                        VStack(alignment: .leading, spacing: 6) {
                            Text("RECIPE")
                                .font(.system(.subheadline, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(.black.opacity(0.5))

                            Text(meal.name.uppercased())
                                .font(.system(.largeTitle, design: .rounded))
                                .fontWeight(.bold)
                                .foregroundColor(.black.opacity(0.9))
                                .minimumScaleFactor(0.75)
                        }

                        SectionHeader("INGREDIENTS")
                        VStack(alignment: .leading, spacing: Layout.listRowSpacing) {
                            ForEach(meal.ingredients, id: \.self) { item in
                                BulletRow(text: item)
                            }
                        }

                        SectionHeader("DIRECTIONS")
                        VStack(alignment: .leading, spacing: Layout.listRowSpacing) {
                            ForEach(Array(meal.instructions.enumerated()), id: \.offset) { idx, step in
                                NumberedRow(num: idx + 1, text: step)
                            }
                        }

                        Button(action: {}) {
                            Text("Done!")
                                .font(.system(.title2, design: .rounded))
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: Layout.doneButtonHeight)
                                .background(Color(red: 1.00, green: 0.65, blue: 0.0))
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                                .shadow(color: .black.opacity(0.15), radius: 6, x: 0, y: 3)
                        }
                        .padding(.top, Layout.sectionSpacing)
                        .padding(.horizontal, Layout.doneButtonHPad)
                        .padding(.bottom, Layout.doneButtonVPad)
                    }
                    .padding(.horizontal, Layout.cardHPad)
                    .padding(.vertical, Layout.cardVPad)
                    .frame(maxWidth: Layout.maxContentWidth, alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: Layout.cardCorner, style: .continuous)
                            .fill(Color.white.opacity(0.95))
                            .shadow(color: .black.opacity(0.10), radius: 10, x: 0, y: 6)
                    )
                    .padding(.horizontal, Layout.cardHPad)

                    .overlay(alignment: .topTrailing) {
                        ZStack(alignment: .topTrailing) {
                            Button {
                                isBookmarked.toggle()
                            }
                            label: {
                                Image(systemName: isBookmarked ? "bookmark.fill" : "bookmark")
                                    .font(.system(size: 26, weight: .bold))
                                    .foregroundColor(Color(red: 1.00, green: 0.65, blue: 0.0))
                                    .padding(.trailing, 10)
                                    .padding(.top, -2)
                                    .offset(x: -120)
                                
                            }

                            Image(meal.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: Layout.imageSize, height: Layout.imageSize)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .black.opacity(0.20), radius: 8, x: 0, y: 4)
                                .offset(x: 30, y: -Layout.imageRise)
                        }
                        .padding(.trailing, 20)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .top)
                .padding(.top, 8)
            }
            .scrollIndicators(.hidden)
        }
    }
}

private struct SectionHeader: View {
    var title: String
    init(_ t: String) { self.title = t }
    var body: some View {
        Text(title)
            .font(.system(.title3, design: .rounded))
            .fontWeight(.bold)
            .foregroundColor(.black.opacity(0.85))
            .padding(.top, 4)
    }
}

private struct BulletRow: View {
    var text: String
    var body: some View {
        HStack(alignment: .firstTextBaseline, spacing: 10) {
            Image(systemName: "circle.fill")
                .font(.system(size: 6))
                .foregroundColor(.orange)
                .padding(.top, 3)
                .accessibilityHidden(true)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.black.opacity(0.9))
        }
    }
}

private struct NumberedRow: View {
    var num: Int
    var text: String
    var body: some View {
        HStack(alignment: .top, spacing: 10) {
            Text("\(num).")
                .font(.system(.body, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(.orange)
            Text(text)
                .font(.system(.body, design: .rounded))
                .foregroundColor(.black.opacity(0.9))
        }
    }
}

#Preview {
    RecipeView(meal: SampleMeals.turkeySandwich)
}

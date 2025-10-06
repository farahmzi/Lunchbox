import SwiftUI

struct SplashView: View {
    
    // متغيرات التحكم في الحركة والانتقال
    @State private var isActive = false
    @State private var logoVerticalOffset: CGFloat = 0
    @State private var textOpacity: Double = 0.0
    @State private var logoScale = 0.8

    let appName: String = "LUNCH BOX"
    
    var body: some View {
        if isActive {
//            // **الانتقال الآمن:** سيذهب إلى ContentView الأصلي
//            MenuCategoriesView()
        } else {
            ZStack {
                
                // 1. الخلفية (bg)
                Image("bg") // تأكد أن اسم الأصول في Assets هو "bg"
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)

                // 2. المحتوى (اللوجو والنص)
                VStack(spacing: 5) {
                    
                    // اللوجو (mogo)
                    Image("mogo") // تأكد أن اسم الأصول في Assets هو "mogo"
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .scaleEffect(logoScale)
                    
                    // اسم التطبيق (LUNCH BOX)
                    Text(appName)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                        .opacity(textOpacity) // يبدأ مخفياً
                }
                .offset(y: logoVerticalOffset) // تطبيق حركة الارتفاع هنا
            }
            // 3. التحكم في الحركات والمؤقت
            .onAppear {
                
                // المرحلة 1: تكبير اللوجو لتبدو حية (خلال 1 ثانية)
                withAnimation(.easeOut(duration: 1.0)) {
                    self.logoScale = 1.0
                }
                
                // المؤقت: الانتظار 4.0 ثوانٍ قبل بدء حركة الارتفاع
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    
                    // المرحلة 2: حركة الارتفاع وظهور النص (1.5 ثانية حركة ناعمة)
                    withAnimation(.spring(response: 1.5, dampingFraction: 0.5, blendDuration: 0.5)) {
                        
                        self.logoVerticalOffset = -100 // الارتفاع للأعلى
                        self.textOpacity = 1.0           // إظهار النص تدريجياً
                    }
                    
                    // المرحلة 3: الانتقال للصفحة الرئيسية بعد انتهاء الحركة
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 + 0.5) {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashView()
}

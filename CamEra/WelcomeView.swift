import SwiftUI

struct WelcomeView: View {
    @Binding var isWelcomeSheetShowing: Bool
    
    var body: some View {
        VStack {
            VStack {
                Text("Welcome back to")
                    .font(.system(.title, design: .rounded))
                    .fontWeight(.bold)
                AnimatedYearView()
                    .font(.system(size: 96, weight: .bold, design: .rounded))
                    .frame(maxHeight: 96)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Text("This app brings together your favorite \n old filters in one app.")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24.0)
                .padding(.bottom)
            Text("Easily apply stunning filters and bring your photos to life. Effortlessly edit and enhance your moments with a powerful toolkit.")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24.0)
                .padding(.bottom, 32.0)
            LargeButton(text: "Get Started", maxWidth: .infinity, action: {
            })
            .padding(.horizontal)
            .padding(.bottom, 20.0)
            Text("About App and Privacy")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24.0)
                .padding(.bottom)
            Spacer()
        }
        .background(
            LinearGradient(
                stops: [
                    Gradient.Stop(color: Color(red: 0.5, green: 0.4, blue: 1), location: 0.00),
                    Gradient.Stop(color: .black, location: 1.00),
                ],
                startPoint: UnitPoint(x: 0.5, y: 0),
                endPoint: UnitPoint(x: 0.5, y: 1)
            )
        )
        .interactiveDismissDisabled()
    }
}

#Preview {
    WelcomeView(isWelcomeSheetShowing: .constant(true))
}

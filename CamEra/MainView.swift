import SwiftUI

struct MainView: View {
    @AppStorage("isWelcomeSheetShowing") var isWelcomeSheetShowing = true
    
    var body: some View {
        VStack {
            Spacer()
                .frame(maxHeight: .infinity)
            Text("Now you are in 2015")
                .font(.system(.largeTitle, design: .rounded))
                .fontWeight(.semibold)
                .padding(.bottom)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 24.0)
            Spacer()
                .frame(maxHeight: .infinity)
            LargeButton(text: "Test Button", action: {})
            Spacer()
                .frame(maxHeight: .infinity)
        }
        .padding()
        .sheet(isPresented: $isWelcomeSheetShowing) {
            WelcomeView(isWelcomeSheetShowing: $isWelcomeSheetShowing)
        }
    }
}

#Preview {
    MainView()
}

#Preview {
    MainView()
        .sheet(isPresented: .constant(true)) {
            WelcomeView(isWelcomeSheetShowing: .constant(true))
        }
}

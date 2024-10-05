import SwiftUI

struct MainView: View {
    @AppStorage("isWelcomeSheetShowing") var isWelcomeSheetShowing = true
    
    var body: some View {
        VStack {
            Text("Main View")
        }
        .sheet(isPresented: $isWelcomeSheetShowing) {
            WelcomeView(isWelcomeSheetShowing: $isWelcomeSheetShowing)
        }
    }
}

#Preview {
    MainView()
}

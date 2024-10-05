import SwiftUI

struct WelcomeView: View {
    @Binding var isWelcomeSheetShowing: Bool
    
    var body: some View {
        VStack {
            Text("Welcome to SwiftUI")
                .font(.largeTitle)
            Text("SwiftUI is a new framework for building user interfaces")
                .font(.title)
            Text("Try out the examples to get started")
                .font(.subheadline)
            LargeButton(text: "Close", maxWidth: .infinity, action: {
                isWelcomeSheetShowing.toggle()
            })
        }
        .interactiveDismissDisabled()
    }
}

#Preview {
    WelcomeView(isWelcomeSheetShowing: .constant(true))
}

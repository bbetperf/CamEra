import SwiftUI

struct LargeButton: View {
    var text: String
    var icon: Image?
    var maxWidth: CGFloat?
    var action: () -> Void
    
    @Environment(\.isEnabled) var isEnabled
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .frame(maxWidth: maxWidth)
                .padding(.horizontal, 20)
                .padding(.vertical, 14)
                .background(.orange)
                .foregroundColor(.white)
                .cornerRadius(12)
        }
        .hapticFeedbackOnTap()
    }
}

#Preview {
    VStack {
        LargeButton(text: "Full Width Button", maxWidth: .infinity, action: {
            
        })
        .frame(maxWidth: .infinity)
        
        LargeButton(text: "Fixed Width Button", maxWidth: 200, action: {
            
        })
        .frame(maxWidth: 300)
    }
    .frame(maxWidth: .infinity)
    .padding(16)
}

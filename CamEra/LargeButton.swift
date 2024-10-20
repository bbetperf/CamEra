import SwiftUI
import UIKit

struct LargeButton: View {
    var text: String
    var icon: Image?
    var maxWidth: CGFloat?
    var normalColor: Color = .bgAccent
    var pressedColor: Color = .bgAccentActive
    var action: () -> Void
    
    @Environment(\.isEnabled) var isEnabled
    @GestureState private var isPressed = false
    @State private var isTriggered = false
    
    var body: some View {
        buttonContent
            .background(isPressed ? pressedColor : normalColor)
            .cornerRadius(16)
            .scaleEffect(isPressed ? 0.95 : 1.0)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .updating($isPressed) { _, state, _ in
                        state = true
                    }
                    .onEnded { _ in
                        if !isTriggered {
                            isTriggered = true
                            action()
                            hapticFeedback(.selection)
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                                isTriggered = false
                            }
                        }
                    }
            )
            .animation(.easeInOut(duration: 0.1), value: isPressed)
    }
    
    private var buttonContent: some View {
        HStack {
            if let icon = icon {
                icon
                    .foregroundColor(.white)
            }
            Text(text)
        }
        .frame(maxWidth: maxWidth)
        .padding(.horizontal, 20)
        .padding(.vertical, 16)
        .foregroundColor(.white)
        .font(.system(.body, design: .rounded))
        .contentShape(Rectangle())
    }
}

#Preview {
    VStack {
        LargeButton(text: "Full Width Button", icon: Image(systemName: "star.fill"), maxWidth: .infinity, action: {
            print("Button tapped")
        })
        .frame(maxWidth: .infinity)
        
        LargeButton(text: "Fixed Width Button", maxWidth: 200, action: {
            print("Fixed width button tapped")
        })
        .frame(maxWidth: 300)
    }
    .frame(maxWidth: .infinity)
    .padding()
}

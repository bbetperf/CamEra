import SwiftUI
import UIKit

extension View {
    func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
        self.simultaneousGesture(TapGesture().onEnded {
            let impact = UIImpactFeedbackGenerator(style: style)
            impact.impactOccurred()
        })
    }
}

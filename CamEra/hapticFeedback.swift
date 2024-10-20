import SwiftUI
import UIKit

enum HapticFeedbackType {
    case impact(style: UIImpactFeedbackGenerator.FeedbackStyle)
    case selection
    case notification(type: UINotificationFeedbackGenerator.FeedbackType)
}

extension View {
    func hapticFeedback(_ type: HapticFeedbackType = .selection) {
        switch type {
        case .impact(let style):
            let impactFeedback = UIImpactFeedbackGenerator(style: style)
            impactFeedback.impactOccurred()
        case .selection:
            let selectionFeedback = UISelectionFeedbackGenerator()
            selectionFeedback.selectionChanged()
        case .notification(let feedbackType):
            let notificationFeedback = UINotificationFeedbackGenerator()
            notificationFeedback.notificationOccurred(feedbackType)
        }
    }
}

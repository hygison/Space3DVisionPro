import SwiftUI

struct HoverBackgroundlessButtonStyle: ButtonStyle {
    var padding: CGFloat = 16

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(padding)
            .contentShape(RoundedRectangle(cornerRadius: 16))
            .opacity(configuration.isPressed ? 0.5 : 1.0)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)
            .hoverEffect()
    }
}

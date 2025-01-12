import SwiftUI

@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }

    var activeSpace = "building_outside"
    var immersiveSpaceState = ImmersiveSpaceState.closed

    func setSpace(_ space: String) {
        self.activeSpace = space
    }
}

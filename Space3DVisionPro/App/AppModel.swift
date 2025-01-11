//
//  AppModel.swift
//  Space3DVisionPro
//
//  Created by Hygison on 2025/01/10.
//

import SwiftUI

/// Maintains app-wide state
@MainActor
@Observable
class AppModel {
    let immersiveSpaceID = "ImmersiveSpace"
    enum ImmersiveSpaceState {
        case closed
        case inTransition
        case open
    }

    var activeSpace = "AdobeStock_326375001_Preview"
    var immersiveSpaceState = ImmersiveSpaceState.closed

    func setSpace(_ space: String) {
        self.activeSpace = space
    }
}

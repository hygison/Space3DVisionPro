//
//  ContentView.swift
//  Space3DVisionPro
//
//  Created by Hygison on 2025/01/10.
//

import RealityKit
import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var appModel

    let SPACES_STRING: [String] = [
        "AdobeStock_326375001_Preview",
        "AdobeStock_223778008_Preview",
        "AdobeStock_233005056_Preview",
        "AdobeStock_322882600_Preview",
        "AdobeStock_326375001_Preview"
    ]

    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack(alignment: .center, spacing: 60) {
                ForEach(SPACES_STRING, id: \.self) { spaceName in
                    VStack {
                        Button(action: { appModel.setSpace(spaceName) }) {
                            Text(spaceName)
                        }
                        Image(uiImage: UIImage(named: spaceName)!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 2*537.6, height: 2*268.8)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .clipped()
                        //                    5376 × 2688
                    }
                }
            }
        }
        .navigationTitle("Spaces")
        .toolbar {
            ToolbarItem(placement: .bottomOrnament) {
                HStack {
                    ToggleImmersiveSpaceButton()
                    Text(appModel.activeSpace)
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}

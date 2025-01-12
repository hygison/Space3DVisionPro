import RealityKit
import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var appModel

    let SPACES_STRING: [String] = [
        "building_outside", // Ref: Insta360
        "building_park_2",
        "building_park",
        "home_corridor",
        "lawsome",
        "parking_entrance",
        "kris-guico-rsB-he-ye7w-unsplash", // Ref: unsplash
        "bryan-goff-IuyhXAia8EA-unsplash",
        "AdobeStock_326375001_Preview", // Ref: AdobeStock
        "AdobeStock_223778008_Preview",
        "AdobeStock_233005056_Preview",
        "AdobeStock_322882600_Preview"
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

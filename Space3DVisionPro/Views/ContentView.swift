import RealityKit
import SwiftUI

struct ContentView: View {
    @Environment(AppModel.self) private var appModel
    @State private var isSearching = false
    @State private var searchText = ""

    let SPACES_STRING: [String] = [
        "building_outside",  // Ref: Insta360
        "building_park_2",
        "building_park",
        "home_corridor",
        "lawsome",
        "parking_entrance",
        "kris-guico-rsB-he-ye7w-unsplash",  // Ref: unsplash
        "bryan-goff-IuyhXAia8EA-unsplash",
        "AdobeStock_326375001_Preview",  // Ref: AdobeStock
        "AdobeStock_223778008_Preview",
        "AdobeStock_233005056_Preview",
        "AdobeStock_322882600_Preview",
    ]
    let imageSize = 1.0

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(alignment: .leading) {
                    ForEach(SPACES_STRING, id: \.self) { spaceName in
                        HStack(alignment: .top) {
                            Image(uiImage: UIImage(named: spaceName)!)
                                .resizable()
                                .scaledToFill()
                                .frame(
                                    width: imageSize * 537.6,
                                    height: imageSize * 268.8
                                )
                                .clipped()
                                .padding(.trailing, 20)

                            VStack(alignment: .leading) {
                                Text(spaceName)
                                    .font(.extraLargeTitle2)
                                    .lineLimit(1)
                                    .truncationMode(.tail)
                                    .help(Text(spaceName))
                                Spacer()
                                HStack {
                                    Spacer()
                                    Button(action: {
                                        appModel.setSpace(spaceName)
                                    }) {
                                        Image(systemName: "play")
                                            .font(.title)
                                    }
                                }
                            }
                        }
                        .padding()
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
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        if isSearching {
                            HStack {
                                TextField("Search", text: $searchText)
                                    .textFieldStyle(.roundedBorder)
                                    .frame(width: 500)
                                    .onSubmit {
                                        print(
                                            "Search text submitted: \(searchText)"
                                        )
                                    }
                                Button(action: {
                                    withAnimation { isSearching.toggle() }
                                    //TODO: Search
                                }) {
                                    Image(systemName: "magnifyingglass")
                                }
                            }

                        } else {
                            Button(action: {
                                withAnimation { isSearching.toggle() }
                            }) {
                                Image(systemName: "magnifyingglass")
                            }
                        }
                    }
                }
            }
        }

    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}

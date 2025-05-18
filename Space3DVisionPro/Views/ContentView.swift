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

    let description =
        "Lorem ipsum dolor sit amet. At possimus aliquam non sunt exercitationem et omnis earum et voluptatibus perspiciatis non dignissimos dolor aut commodi sint. Est culpa architecto ut sunt fugiat aut quidem quisquam eum praesentium iusto in laudantium beatae. Ut eaque molestiae aut facilis nesciunt ea odio ipsum in quia officia sed facere accusantium ut facilis totam aut iusto porro. Et ipsa cupiditate et eius suscipit quo pariatur exercitationem et illo perferendis sed omnis libero!"

    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(
                    columns: [
                        GridItem(.adaptive(minimum: 400), spacing: 10)
                    ], spacing: 10
                ) {
                    ForEach(SPACES_STRING, id: \.self) { spaceName in
                        CardImageView(
                            spaceName: spaceName,
                            description: description
                        )
                        .gridCellUnsizedAxes(.vertical)
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

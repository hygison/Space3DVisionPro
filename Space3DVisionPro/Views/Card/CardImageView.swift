import SwiftUI

struct CardImageView: View {
    @Environment(AppModel.self) private var appModel
    var spaceName: String
    var description: String

    @State var showFullDescription: Bool = false

    private var twoLineHeight: CGFloat {
        UIFont
            .preferredFont(forTextStyle: .body)
            .lineHeight * 2
    }

    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 10) {
                Image(uiImage: UIImage(named: spaceName)!)
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity)
                    .clipped()

                VStack(alignment: .leading, spacing: 0) {
                    HStack(alignment: .center) {

                        Button(action: {
                            appModel.setSpace(spaceName)
                        }) {
                            Image(systemName: "play")
                                .font(.largeTitle)
                        }
                        .buttonStyle(HoverBackgroundlessButtonStyle())

                        Button(action: {}) {
                            Image(systemName: "heart")
                                .font(.largeTitle)
                        }
                        .buttonStyle(HoverBackgroundlessButtonStyle())

                        Spacer()

                        Button(action: {}) {
                            Image(systemName: "bookmark")
                                .font(.largeTitle)
                        }
                        .buttonStyle(HoverBackgroundlessButtonStyle())
                    }

                    Text(spaceName)
                        .lineLimit(1)
                        .truncationMode(.tail)
                        .help(Text(spaceName))
                        .font(.largeTitle)

                    ScrollView(.vertical) {
                        Text(description)
                            .font(.body)
                            .lineLimit(showFullDescription ? nil : 1)
                            .truncationMode(.tail)
                            .onTapGesture { showFullDescription.toggle() }
                    }
                    .frame(height: twoLineHeight)
                    .clipped()

                }
            }
        }
    }
}

#Preview {
    CardImageView(
        spaceName: "building_outside",
        description:
            "Lorem ipsum dolor sit amet. At possimus aliquam non sunt exercitationem et omnis earum et voluptatibus perspiciatis non dignissimos dolor aut commodi sint. Est culpa architecto ut sunt fugiat aut quidem quisquam eum praesentium iusto in laudantium beatae. Ut eaque molestiae aut facilis nesciunt ea odio ipsum in quia officia sed facere accusantium ut facilis totam aut iusto porro. Et ipsa cupiditate et eius suscipit quo pariatur exercitationem et illo perferendis sed omnis libero!"
    )
    .environment(AppModel())
}

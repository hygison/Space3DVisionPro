import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveView: View {
    @Environment(AppModel.self) var appModel

    var body: some View {
        RealityView { content in
            content.add(createImmersivePicture(imageName: appModel.activeSpace))
        }
    }

    /// Ref: https://www.createwithswift.com/
    func createImmersivePicture(imageName: String) -> Entity {
        let texture = try? TextureResource.load(
            named: imageName,
            options: .init(
                semantic: .raw,
                compression: .none,
                mipmapsMode: .allocateAndGenerateAll
            )
        )
        var material = UnlitMaterial()
        material.color = .init(texture: .init(texture!))

        let sphereRadius: Float = 1000
        let modelEntity = Entity()
        modelEntity.components.set(
            ModelComponent(
                mesh: .generateSphere(
                    radius: sphereRadius
                ),
                materials: [material]
            )
        )
        modelEntity.scale = .init(x: -1, y: 1, z: 1)
        modelEntity.transform.translation += SIMD3<Float>(0.0, -1.0, 0.0)
        return modelEntity
    }
}

#Preview(immersionStyle: .full) {
    ImmersiveView()
        .environment(AppModel())
}

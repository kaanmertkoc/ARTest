//
//  ContentView.swift
//  HelloAR
//
//  Created by Mohammad Azam on 4/6/22.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        arView.addGestureRecognizer(UITapGestureRecognizer(target: context.coordinator, action: #selector(Coordinator.handleTap)))
    
        context.coordinator.view = arView
        arView.session.delegate = context.coordinator
        
        
        
        let anchor = AnchorEntity(.plane([.vertical, .horizontal],
                              classification: [.wall, .floor, .ceiling],
                               minimumBounds: [1.0, 1.0]))
        
        let material = SimpleMaterial(color: .blue, isMetallic: true)
        let box = ModelEntity(mesh: MeshResource.generateBox(size: 0.3), materials: [material])


        let boxShape = ShapeResource.generateBox(width: 0.3, height: 0.3, depth: 0.3)

        box.generateCollisionShapes(recursive: true)
        

        anchor.addChild(box)
        arView.scene.anchors.append(anchor)
        
        return arView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

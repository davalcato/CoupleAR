//
//  ViewController.swift
//  CoupleAR
//
//  Created by Daval Cato on 11/3/22.
//

import UIKit
import RealityKit

class ViewController: UIViewController {
    
    @IBOutlet var arView: ARView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     //  tether the anchor
        let anchor = AnchorEntity(plane: .horizontal,
                                   minimumBounds: [0.2, 0.2])
        arView.scene.addAnchor(anchor)
        // define array of entities
        var cards: [Entity] = []
        for _ in 1...4 {
                let box = MeshResource.generateBox(
                    width: 0.04,
                    height: 0.002,
                    depth: 0.04)
            // materiel for the boxes
            let metalMaterial = SimpleMaterial(color: .gray, isMetallic: true)
            // create model
            let model = ModelEntity(mesh: box, materials: [metalMaterial])
        }
    }
}

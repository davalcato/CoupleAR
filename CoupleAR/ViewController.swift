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
            
            // the ability to press on the models
            model.generateCollisionShapes(recursive: true)
            
            // cards array append model
            cards.append(model)
            
        }
        // for loop to position the cards in an index or sequence of pairs
        for (index, card) in cards.enumerated() {
                // create an x coordinates
                let x = Float(index % 2)
                let z = Float(index / 2)
            
            // position the cards
            card.position = [x*0.1, 0, z*0.1]
            // add child to anchor
            anchor.addChild(card)
                
        }
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        // location of tap
        let tapLocation = sender.location(in: arView)
        // arView function
        arView.entity(at: tapLocation)
        
    }
    
}

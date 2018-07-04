//
//  ViewController.swift
//  World Tracking
//
//  Created by Amit Vaidya on 04/07/18.
//  Copyright © 2018 Tech Navigator. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    let configuration = ARWorldTrackingConfiguration()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints, ARSCNDebugOptions.showWorldOrigin]
        self.sceneView.session.run(configuration)
    }

    @IBAction func add(_ sender: Any) {
        let node = SCNNode()
//        decides the height, width and length of the box to be created when add is pressed
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
//        UIColor.<give any color here> to choose the color of the box
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.yellow
        
//        move the box around X,Y and Z axis by changing the values (0,0,0) to something else
        node.position = SCNVector3(0,0,0)
        
        self.sceneView.scene.rootNode.addChildNode(node)
    }
    
    @IBAction func reset(_ sender: Any) {
        self.restartSession()
    }
    func restartSession() {
        self.sceneView.session.pause()
        self.sceneView.scene.rootNode.enumerateChildNodes { (node, _) in
            node.removeFromParentNode()
        }
        self.sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


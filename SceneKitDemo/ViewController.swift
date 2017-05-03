//
//  ViewController.swift
//  SceneKitDemo
//
//  Created by 劉洧熏 on 2017/5/1.
//  Copyright © 2017年 劉洧熏. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class ViewController: UIViewController {

    let sceneView = SCNView()
    let moonScene = SCNScene()
    let cameraNode = SCNNode()
    let objectNode = SCNNode()
    let lightNode = SCNNode()

    let screenSize = UIScreen.main.bounds

    override func viewDidLoad() {

        super.viewDidLoad()

        setUpSceneView()
        configObjectNode()
        configCameraNode()
        configLightNode()

    }

    func setUpSceneView() {

        sceneView.translatesAutoresizingMaskIntoConstraints = false
        sceneView.frame = screenSize
        self.view.addSubview(sceneView)

        sceneView.scene = moonScene
        sceneView.autoenablesDefaultLighting = true
        sceneView.allowsCameraControl = true
        sceneView.scene?.background.contents = #imageLiteral(resourceName: "space")

    }
//
    func configObjectNode() {

        objectNode.geometry = SCNSphere(radius: 2.0)
        objectNode.position = SCNVector3Make(0.0, 0.0, 0.0)
        moonScene.rootNode.addChildNode(objectNode)

        objectNode.geometry?.firstMaterial?.diffuse.contents = #imageLiteral(resourceName: "2k_moon")

    }

    func configCameraNode() {

        cameraNode.camera = SCNCamera()
        cameraNode.position = SCNVector3Make(0.0, 0.0, 10.0)
        moonScene.rootNode.addChildNode(cameraNode)

    }

    func configLightNode() {

        lightNode.light = SCNLight()
        lightNode.light?.type = .omni
        lightNode.light?.color = UIColor.white
        lightNode.position = SCNVector3Make(20.0, 0.0, 0.0)
        moonScene.rootNode.addChildNode(lightNode)
   
    }
}


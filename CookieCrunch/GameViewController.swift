//
//  GameViewController.swift
//  CookieCrunch
//
//  Created by Chris Jungmann on 10/28/16.
//  Copyright (c) 2016 Chris Jungmann. All rights reserved.
//
//  Based of RayWenderlich Swift Tutorial
//  https://www.raywenderlich.com/125311/make-game-like-candy-crush-spritekit-swift-part-1


import UIKit
import SpriteKit

class GameViewController: UIViewController {
    
    var scene: GameScene!
    var level: Level!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return [.portrait, .portraitUpsideDown]
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = false
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.scaleMode = .aspectFill
        
        // create the level instance
        level = Level()
        scene.level = level
        
        // Present the scene.
        skView.presentScene(scene)
        
        // start game
        beginGame()
    }

    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newCookies = level.shuffle()
        scene.addSprites(for: newCookies)
    }

}



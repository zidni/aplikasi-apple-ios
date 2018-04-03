//
//  ViewController.swift
//  Roket
//
//  Created by aplikasi on 03/04/18.
//  Copyright © 2018 Zidni Agni. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    @IBOutlet weak var darkBlueBG: UIImageView!
    @IBOutlet weak var powerBtn: UIButton!
    
    @IBOutlet weak var cloudHolder: UIView!
    @IBOutlet weak var rocket: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = Bundle.main.path(forResource: "hustle-on", ofType: "wav")!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.prepareToPlay()
        } catch let error as NSError {
            print(error.description)
        }
        
    }

    @IBAction func powerBtnPressed(_ sender: Any) {
        
        cloudHolder.isHidden = false
        darkBlueBG.isHidden = true
        powerBtn.isHidden = true
        
        player.play()
        
        UIView.animate(withDuration: 2.3, animations: {
            self.rocket.frame = CGRect(x: 0, y: 140, width: 375, height: 402)
        }) { (finished) in
            
            self.backBtn.isHidden = false
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        cloudHolder.isHidden = true
        darkBlueBG.isHidden = false
        backBtn.isHidden = true
        
        
        UIView.animate(withDuration: 0, animations: {
            self.rocket.frame = CGRect(x: 0, y: 380, width: 375, height: 402)
        }) { (finished) in
            self.powerBtn.isHidden = false
        }
        
        
    }
    
    
    
}


//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Noah Patterson on 6/30/16.
//  Copyright © 2016 Noah Patterson. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioUrl: NSURL!
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        try! audioPlayer = AVAudioPlayer(contentsOfURL: recordedAudioUrl)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

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
    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var darthButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopPlayingButton: UIButton!
    
    @IBAction func playSound(sender: UIButton) {
        stopAudio()
        switch ButtonType(rawValue: sender.tag)! {
        case .Slow :
            playSound(rate: 0.5)
        case .Fast:
            playSound(rate: 1.5)
        case .Darth:
            playSound(pitch: -1000)
        case .Chip:
            playSound(pitch: 1000)
        case .Echo:
            playSound(echo: true)
        case .Reverb:
            playSound(reverb: true)
        }
        
        configureUI(.Playing)
    }
    
    
    @IBAction func stopPlaying(sender: UIButton) {
        stopAudio()
        configureUI(.NotPlaying)
    }
    
    var recordedAudioUrl: NSURL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: NSTimer!
    
    enum ButtonType: Int {
        case Slow, Fast, Darth, Chip, Echo, Reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
  
    }
    
    
    override func viewWillAppear(animated: Bool) {
        configureUI(.NotPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

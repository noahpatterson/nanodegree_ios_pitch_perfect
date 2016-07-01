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
    
    @IBAction func playSound(_ sender: UIButton) {
        switch ButtonType(rawValue: sender.tag)! {
        case .slow :
            playSound(rate: 0.5)
        case .fast:
            playSound(rate: 1.5)
        case .darth:
            playSound(pitch: -1000)
        case .chip:
            playSound(pitch: 1000)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    
    @IBAction func stopPlaying(_ sender: UIButton) {
        stopAudio()
        configureUI(.notPlaying)
    }
    
    var recordedAudioUrl: URL!
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    enum ButtonType: Int {
        case slow, fast, darth, chip, echo, reverb
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
  
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        configureUI(.notPlaying)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

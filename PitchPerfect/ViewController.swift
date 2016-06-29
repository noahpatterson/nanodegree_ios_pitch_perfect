//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Noah Patterson on 6/28/16.
//  Copyright © 2016 Noah Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: UIButton) {
        recordingLabel.text = "Recording"
        sender.hidden = true
        stopRecordingButton.hidden = false
    }
    @IBAction func stopRecording(sender: UIButton) {
        recordingLabel.text = "Tap to Record"
        sender.hidden = true
        recordButton.hidden = false
    }
}


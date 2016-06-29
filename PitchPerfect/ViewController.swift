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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(sender: UIButton) {
        if let label = sender.currentTitle {
            if label == "Record" {
                recordingLabel.text = "Recording"
            } else {
                recordingLabel.text = "Tap to Record"
            }
        }
        
    }
}


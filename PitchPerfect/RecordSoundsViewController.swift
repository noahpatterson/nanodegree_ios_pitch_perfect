//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Noah Patterson on 6/28/16.
//  Copyright © 2016 Noah Patterson. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!
    @IBOutlet weak var stopRecordingButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        stopRecordingButton.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func recordAudio(_ sender: UIButton) {
        recordingLabel.text = "Recording"
        sender.isHidden = true
        stopRecordingButton.isHidden = false
        
        let dirpath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let recordingName = "pitchPerfectRecording.wav"
        let pathArray = [dirpath, recordingName]
//        let filePath = URL.fileURL(withPathComponents: pathArray)
        
        let filePath = NSURL.fileURL(withPathComponents: pathArray)
        print(filePath)
        
        //there is only one audio hardware, so you have to grab the only audio hardware available to all apps. This is a singleton.
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        //set speaker?
        try! session.overrideOutputAudioPort(.speaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    @IBAction func stopRecording(_ sender: UIButton) {
        recordingLabel.text = "Tap to Record"
        sender.isHidden = true
        recordButton.isHidden = false
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            self.performSegue(withIdentifier: "playRecording", sender: audioRecorder.url)
        } else {
            print("saving the recording failed with error")
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "playRecording" {
                let playSoundsVc = segue.destinationViewController as! PlaySoundsViewController
                let recordedAudioUrl = sender as! URL
                playSoundsVc.recordedAudioUrl = recordedAudioUrl
            }
        }
    }
}
    




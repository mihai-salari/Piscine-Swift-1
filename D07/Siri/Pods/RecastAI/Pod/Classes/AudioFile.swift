//
//  AudioFile.swift
//  Pods
//
//  Created by PE on 30/03/2016.
//
//

import Foundation
import AVFoundation

/**
Class AudioFile
 
Create an audio file to be processed by the Recast.AI API
*/
class AudioFile
{
    //Declared Globally
    var audioRecorder:AVAudioRecorder!
    var audioPlayer:AVAudioPlayer!
    var path : NSURL!
    
    /**
     Init
     
     Init class
     */
    init () {}
    
    /**
     Start voice recording and save it to .DocumentDirectory under the name "my_audio.wav"
     
     - returns: void
     */
    func recordAudio()
    {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        self.path = filePath
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    /**
     Stop voice recording
     
     - returns: void
     */
    func stopAudio()
    {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
//        audioPlayer = try! AVAudioPlayer(contentsOfURL: self.audioRecorder.url)
//        audioPlayer.prepareToPlay()
//        audioPlayer.play()
    }
}

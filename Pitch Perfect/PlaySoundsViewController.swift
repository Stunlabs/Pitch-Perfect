//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Jörg Klausewitz on 20.04.15.
//  Copyright (c) 2015 Stunlabs. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController, AVAudioPlayerDelegate {

    // Creates AVAudioPlayer object
    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    // Creates AVAudiioengine object
    var audioEngine: AVAudioEngine!
    var audioFile:AVAudioFile!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }
    

    @IBAction func playSlowSound(sender: UIButton) {
        playWithRate( 0.5 ) // half of normal speed
    }
    
    @IBAction func playFastSound(sender: UIButton) {
        playWithRate( 2.0 )  // double of normal speed
    }

    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-800)
    }
    
   
    /// changes the pitch of the audio engine
    ///
    /// :param: pitch The pitch of the audio engine
    func playAudioWithVariablePitch(pitch: Float){
        
        stopAllAudio()

        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        
        audioEngine.attachNode(changePitchEffect)
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    
    /// Stops all audio
    func stopAllAudio(){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        audioPlayer.currentTime = 0.0
    }
    
    /// Changes the rate of sounds 
    ///
    /// :param: rate The rate (speed) of the audio player
    func playWithRate(rate: Float) {
        stopAllAudio()
        audioPlayer.rate = rate
        audioPlayer.play()
    }
    
    
    @IBAction func stopPlaySound(sender: UIButton) {
        stopAllAudio()
    }
    
    
}

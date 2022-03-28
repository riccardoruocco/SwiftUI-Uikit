//  Created by riccardo ruocco on 26/03/22.
//

import Foundation
import AVFoundation

class SoundManager{
    static var shared = SoundManager()
    var isRunning = false
    var audioPlayer: AVAudioPlayer!

    private init(){
        
    }
    func playSound(_ fileName : String, rate:Float) {
        if(isRunning == false){
            guard let soundURL = Bundle.main.url(forResource: fileName, withExtension: nil ) else {
                fatalError("Unable to find \(fileName) in bundle")
            }
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer.numberOfLoops = -1
                audioPlayer.prepareToPlay()
                audioPlayer.rate = rate
                audioPlayer.play()
                isRunning = true
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    func stopSound(){
        audioPlayer.stop()
        isRunning = false
    }
    func setRate(rate:Float){
        if(isRunning){
            audioPlayer.rate = rate
        }
    }
}



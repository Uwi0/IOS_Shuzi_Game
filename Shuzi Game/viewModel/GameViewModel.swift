import Foundation
import Observation
import AVFoundation

@Observable
class GameViewModel {
    var gameModel: GameModel = .defaultGameModel
    var audioPlayer: AVAudioPlayer?
    
    func randomSuccessSound(){
        playSound(name: ["awesome", "bell", "correct", "whoop", "yes"].randomElement() ?? "awesome")
    }
    
    func randomInCorrectSound(){
        playSound(name: ["OhNo","incorrectAnswer","weak"].randomElement() ?? "incorrectAnswer")
    }
    
    func playNumber(num: Int) {
        
    }
    
    private func playDigit(num: Int) {
        
    }
    
    private func digitToName(digit: Int) -> String? {
        return nil
    }
    
    private func playSound(name: String, ext: String = "aiff") {
        guard let soundUrl = Bundle.main.url(forResource: name, withExtension: ext)
        else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundUrl)
            audioPlayer?.prepareToPlay()
            audioPlayer?.volume = gameModel.volume
            audioPlayer?.play()
        }catch let error {
            print(error.localizedDescription)
        }
    }
}

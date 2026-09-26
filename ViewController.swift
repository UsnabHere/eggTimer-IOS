

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let property = ["Soft":300,"Medium":420,"Hard":720]
    var timer = Timer()
    
    
    var totalTime = 0
    var secondsPassed = 0
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0
        
    }
    
    @IBAction func hardnessSelected(_ sender: Any) {
        
        timer.invalidate()
        let hardness = (sender as AnyObject).currentTitle
        totalTime = property[hardness!!]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        titleLabel.text = hardness!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
        
    }
    
    var player: AVAudioPlayer!
        
    func playAudio() {
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
            
        }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            let percentageProgress = Float(secondsPassed)/Float(totalTime)
            progressBar.progress = percentageProgress
            
        }
        else {
            timer.invalidate()
            titleLabel.text = "It is done bro 🙁"
            playAudio()
            
            
            
        }
        
    }
    
    
}

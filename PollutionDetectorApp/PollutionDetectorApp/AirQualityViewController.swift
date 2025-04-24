//
//  AirQualityViewController.swift
//  PollutionDetectorApp
//
//  Created by Bhavani Kongari on 3/30/25.
//

import UIKit
import AVFoundation

class AirQualityViewController: UIViewController {

    
    @IBOutlet weak var pm25label: UILabel!
    
    @IBOutlet weak var pm10label: UILabel!
    
    @IBOutlet weak var AirResultlabel: UILabel!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    @IBOutlet weak var videoContainer: UIActivityIndicatorView!
    
    
    
    private var queuePlayer: AVQueuePlayer?
    private var playerLooper: AVPlayerLooper?
    private var playerLayer: AVPlayerLayer?
    
    var enteredpm25 = ""
    var enteredpm10 = ""
    var result = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pm25label.text! += "\(enteredpm25)"
        pm10label.text! += "\(enteredpm10)"
        AirResultlabel.text! += result
        playLoopingVideo(name: name)
    }
    
    func playLoopingVideo(name: String) {
                    playerLayer?.removeFromSuperlayer()

        guard let url = Bundle.main.url(forResource: name, withExtension: "mp4") else {
            print("Video file not found.")
            return
        }
        let playerItem = AVPlayerItem(url: url)
        queuePlayer = AVQueuePlayer()
        playerLayer = AVPlayerLayer(player: queuePlayer)
        playerLayer?.frame = videoContainer.bounds
        playerLayer?.videoGravity = .resizeAspectFill
        videoContainer.layer.addSublayer(playerLayer!)

        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)

                            
        queuePlayer?.volume = 1.0
        queuePlayer?.isMuted = false
        queuePlayer?.play()
        pauseBtn.setTitle("", for: .normal)
        }
        
        @IBAction func playPauseTapped(_ sender: UIButton) {
            guard let player = queuePlayer else { return }

                if player.timeControlStatus == .playing {
                    player.pause()
                    sender.setTitle("", for: .normal)
                } else {
                    player.play()
                    sender.setTitle("", for: .normal)
                }
        }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

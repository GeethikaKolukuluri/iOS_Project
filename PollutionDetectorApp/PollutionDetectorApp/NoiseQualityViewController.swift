//
//  NoiseQualityViewController.swift
//  PollutionDetectorApp
//
//  Created by Geethika Kolukuluri on 4/1/25.
//

import UIKit
import AVFoundation

class NoiseQualityViewController: UIViewController {

    @IBOutlet weak var enteredTrafficVolumeOL: UILabel!
    
    @IBOutlet weak var enteredDistanceFromRoadOL: UILabel!
    
    @IBOutlet weak var noiseResultOL: UILabel!
    
    @IBOutlet weak var viewContainer: UIActivityIndicatorView!
    
    private var queuePlayer: AVQueuePlayer?
    private var playerLooper: AVPlayerLooper?
    private var playerLayer: AVPlayerLayer?
    
    @IBOutlet weak var pauseBtn: UIButton!
    var enteredTrafficVolume = ""
    var enterdDistanceFromRoad = ""
    var noiseResult = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredTrafficVolumeOL.text! += "\(enteredTrafficVolume) db."
        enteredDistanceFromRoadOL.text! += "\(enterdDistanceFromRoad) km."
        noiseResultOL.text! += noiseResult
        playLoopingVideo(name: imageName)
        // Do any additional setup after loading the view.
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
        playerLayer?.frame = viewContainer.bounds
        playerLayer?.videoGravity = .resizeAspectFill
        viewContainer.layer.addSublayer(playerLayer!)

        playerLooper = AVPlayerLooper(player: queuePlayer!, templateItem: playerItem)

                            
        queuePlayer?.volume = 1.0
        queuePlayer?.isMuted = false
        queuePlayer?.play()
        pauseBtn.setTitle("", for: .normal)
        }
    @IBAction func pauseButton(_ sender: UIButton) {
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

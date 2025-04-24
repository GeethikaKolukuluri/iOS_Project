//
//  WaterQualityViewController.swift
//  PollutionDetectorApp
//
//  Created by Sri Vidya Vilipala on 4/2/25.
//

import UIKit
import AVFoundation

class WaterQualityViewController: UIViewController {

    @IBOutlet weak var PHLevelOL: UILabel!
    
    @IBOutlet weak var DisslovedOxygenOL: UILabel!
    
    @IBOutlet weak var TurbidityOL: UILabel!
    
    @IBOutlet weak var TdsOL: UILabel!
    
    @IBOutlet weak var ResultOL: UILabel!
    
    @IBOutlet weak var viewContainer: UIActivityIndicatorView!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    private var queuePlayer: AVQueuePlayer?
    private var playerLooper: AVPlayerLooper?
    private var playerLayer: AVPlayerLayer?
    
    var PHValue = 0.0
    var disslovedOxy = 0.0
    var turbidity = 0.0
    var tdsValue = 0.0
    var result = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PHLevelOL.text! += "\(PHValue)"
        DisslovedOxygenOL.text! += "\(disslovedOxy)"
        TurbidityOL.text! += "\(turbidity)"
        TdsOL.text! += "\(tdsValue)"
        ResultOL.text! = "\(result)"
        playLoopingVideo(name: name)

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
    
    
    @IBAction func playPauseBtn(_ sender: UIButton) {
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

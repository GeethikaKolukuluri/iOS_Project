//
//  LandQualityViewController.swift
//  PollutionDetectorApp
//
//  Created by Sri Vidya Vilipala on 4/2/25.
//

import UIKit
import AVFoundation

class LandQualityViewController: UIViewController {

    @IBOutlet weak var MetalConcentrationOL: UILabel!
    
    @IBOutlet weak var BiologicalGrowthOL: UILabel!
    
    @IBOutlet weak var SoilPHLevelOL: UILabel!
    
    @IBOutlet weak var ResultOL: UILabel!
    
    @IBOutlet weak var videoContainer: UIActivityIndicatorView!
    
    @IBOutlet weak var pauseBtn: UIButton!
    
    private var queuePlayer: AVQueuePlayer?
    private var playerLooper: AVPlayerLooper?
    private var playerLayer: AVPlayerLayer?
    
    var metal = 0.0
    var biologicalGrowth = 0.0
    var soilPHLevel = 0.0
    var result = ""
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        MetalConcentrationOL.text! += "\(metal)"
        BiologicalGrowthOL.text! += "\(biologicalGrowth)"
        SoilPHLevelOL.text! += "\(soilPHLevel)"
        ResultOL.text! = "\(result)"
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

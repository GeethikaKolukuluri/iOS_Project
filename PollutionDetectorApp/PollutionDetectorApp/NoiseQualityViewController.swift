//
//  NoiseQualityViewController.swift
//  PollutionDetectorApp
//
//  Created by Geethika Kolukuluri on 4/1/25.
//

import UIKit

class NoiseQualityViewController: UIViewController {

    @IBOutlet weak var enteredTrafficVolumeOL: UILabel!
    
    @IBOutlet weak var enteredDistanceFromRoadOL: UILabel!
    
    @IBOutlet weak var noiseResultOL: UILabel!
    
    @IBOutlet weak var imageOL: UIImageView!
    
    var enteredTrafficVolume = ""
    var enterdDistanceFromRoad = ""
    var noiseResult = ""
    var imageName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        enteredTrafficVolumeOL.text! += "\(enteredTrafficVolume) db."
        enteredDistanceFromRoadOL.text! += "\(enterdDistanceFromRoad) km."
        noiseResultOL.text! += noiseResult
        imageOL.image = UIImage(named: imageName)
        imageOL.alpha = 0.0
        UIView.animate(withDuration: 1.5) {
            self.imageOL.alpha = 1.0
        }
        // Do any additional setup after loading the view.
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

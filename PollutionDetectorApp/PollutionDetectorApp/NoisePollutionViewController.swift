//
//  NoisePollutionViewController.swift
//  PollutionDetectorApp
//
//  Created by Geethika Kolukuluri on 4/1/25.
//

import UIKit

class NoisePollutionViewController: UIViewController {

    @IBOutlet weak var trafficVolumeOL: UITextField!
    
    @IBOutlet weak var distanceFromRoadOL: UITextField!
    
    var trafficVolume = 0
    var distanceFromRoad = 0.0
    var noiseLevel = 0.0
    var image = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func qualityCheckBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
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

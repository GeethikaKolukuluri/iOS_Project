//
//  NoisePollutionViewController.swift
//  PollutionDetectorApp
//
//  Created by Geethika Kolukuluri on 4/1/25.
//

import UIKit
import AVFoundation

class NoisePollutionViewController: UIViewController {
    
    @IBOutlet weak var trafficVolumeOL: UITextField!
    
    @IBOutlet weak var distanceFromRoadOL: UITextField!
    
    @IBOutlet weak var qualityBtnOL: UIButton!
    
    @IBOutlet weak var resetBtnOL: UIButton!
    
    var trafficVolume = 0
    var distanceFromRoad = 0.0
    var noiseLevel = 0.0
    var result = ""
    var image = ""
    var audioPlayer: AVAudioPlayer?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func qualityCheckBtnClicked(_ sender: UIButton) {
        
        // Validate if the trafficVolume and distanceFromRoad are numeric and non-empty
        if let trafficVolumeText = trafficVolumeOL.text, let distanceFromRoadText = distanceFromRoadOL.text,
           Int(trafficVolumeText) == nil || Double(distanceFromRoadText) == nil {
            
            //generate an alert saying invalid
            let alertController = UIAlertController(title: "Invalid Input⚠️", message: "Please enter valid numeric values for traffic volume and distance from road.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            AudioServicesPlayAlertSound(1005)
            
            return
            
        }
            
            trafficVolume = Int(trafficVolumeOL.text!)!
            distanceFromRoad = Double(distanceFromRoadOL.text!)!
            
            // Simplified TNL estimation formula
            noiseLevel = Double(trafficVolume) + 20 * (log10(1 / distanceFromRoad))
            
            
            
            if noiseLevel>=100{
                let alertController = UIAlertController(title: "Heavy Noise‼️🚨", message: "Estimated Traffic Noise Level is \(String(format: "%.2f", noiseLevel)) db.Immediate action recommended to protect hearing.", preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(defaultAction)
                present(alertController, animated: true, completion: nil)
                AudioServicesPlayAlertSound(1322)
                return
            }else if noiseLevel>=85 && noiseLevel<100{
                image = "worstNoise"
                result = "Estimated Traffic Noise Level is \(String(format: "%.2f", noiseLevel)) db which is quite high. Consider using ear protection or avoiding prolonged exposure."
            }else if noiseLevel>60 && noiseLevel<85{
                image = "badNoise"
                result = "Estimated Traffic Noise Level is \(String(format: "%.2f", noiseLevel)) db which is moderate. Be cautious, especially with prolonged exposure."
            }else if noiseLevel<60{
                image = "goodNoise"
                result = "Estimated Traffic Noise Level is \(String(format: "%.2f", noiseLevel)) db which is good. No immediate action needed. Enjoy the calm!"
            }
        AudioServicesPlaySystemSound(1156)
        performSegue(withIdentifier: "NoiseQualitySegue", sender: self)
        
    }
    
    @IBAction func textFields(_ sender: UITextField) {
        if !(trafficVolumeOL.text!.isEmpty) && !(distanceFromRoadOL.text!.isEmpty) {
            qualityBtnOL.isEnabled = true
            resetBtnOL.isEnabled = true
        } else {
            qualityBtnOL.isEnabled = false
            resetBtnOL.isEnabled = false
        }
    }
    
    
    
    @IBAction func resetBtnClicked(_ sender: UIButton) {
        // Empty all the fields
        trafficVolumeOL.text! = ""
        distanceFromRoadOL.text! = ""
        qualityBtnOL.isEnabled = false
        resetBtnOL.isEnabled = false
        AudioServicesPlaySystemSound(1000)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "NoiseQualitySegue" {
            if let destination = segue.destination as? NoiseQualityViewController {
                destination.enteredTrafficVolume = String(trafficVolume)
                destination.enterdDistanceFromRoad = String(distanceFromRoad)
                destination.noiseResult = result
                destination.imageName = image
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
    }
}

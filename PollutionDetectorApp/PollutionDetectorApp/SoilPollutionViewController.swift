//
//  LandPollutionViewController.swift
//  PollutionDetectorApp
//
//  Created by Sri Vidya Vilipala on 4/2/25.
//

import UIKit
import AVFoundation

class LandPollutionViewController: UIViewController {

    @IBOutlet weak var MetalConcentrationOL: UITextField!
    
    @IBOutlet weak var BiologicalGrowthOL: UITextField!
    
    @IBOutlet weak var SoilPHLevel: UITextField!
    
    @IBOutlet weak var checkBtnOL: UIButton!
    
    @IBOutlet weak var resetBtnOL: UIButton!
    var mcolText = 0.0
    var bgoText = 0.0
    var spText = 0.0
    var result = ""
    var imgName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func QualityCheckBtn(_ sender: UIButton) {
        
        if let mcolText = MetalConcentrationOL.text, let bgoText = BiologicalGrowthOL.text, let spText = SoilPHLevel.text,
           Double(mcolText) == nil || Double(bgoText) == nil || Double(spText) == nil{
            
            //generate an alert saying invalid
            let alertController = UIAlertController(title: "Invalid Input⚠️", message: "Please enter valid numeric values for mcolText and bgoText and spText.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            AudioServicesPlayAlertSound(1005)
            
            return
            
        }
        
        mcolText = Double(MetalConcentrationOL.text!)!
        bgoText = Double(BiologicalGrowthOL.text!)!
        spText = Double(SoilPHLevel.text!)!
        
        let averagePollution = (mcolText + bgoText + spText) / 3
        
        if averagePollution < 30 {
            result = "Soil Pollution Level: Low"
            imgName = "LowSoil"
        } else if averagePollution >= 30 && averagePollution < 60 {
            result = "Soil Pollution Level: Medium"
            imgName = "MediumSoil"
        } else if averagePollution >= 60 && averagePollution < 90 {
            result = "Soil Pollution Level: High"
            imgName = "HighSoil"
        } else {
            let alertController = UIAlertController(title: "Extreme Soil Pollution‼️🚨", message: "Estimated Soil Pollution Level is \(String(format: "%.2f", averagePollution)). Immediate action recommended to relocate.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return
        }
        AudioServicesPlayAlertSound(1322)
        performSegue(withIdentifier: "LandQualitySegue", sender: self)
    }
    
    
   
    @IBAction func textFeild(_ sender: UITextField) {
        if !(MetalConcentrationOL.text!.isEmpty) && !(BiologicalGrowthOL.text!.isEmpty) && !(SoilPHLevel.text!.isEmpty) {
            checkBtnOL.isEnabled = true
            resetBtnOL.isEnabled = true
        } else {
            checkBtnOL.isEnabled = false
            resetBtnOL.isEnabled = false
        }
    }
    
    @IBAction func ResetBtn(_ sender: UIButton) {
        MetalConcentrationOL.text! = ""
        BiologicalGrowthOL.text! = ""
        SoilPHLevel.text! = ""
        checkBtnOL.isEnabled = false
        resetBtnOL.isEnabled = false
        AudioServicesPlaySystemSound(1000)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "LandQualitySegue" {
            var destination = segue.destination as! LandQualityViewController
            destination.metal = mcolText
            destination.biologicalGrowth = bgoText
            destination.soilPHLevel = spText
            destination.result = result
            destination.name = imgName
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


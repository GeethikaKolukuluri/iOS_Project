//
//  WaterPollutionViewController.swift
//  PollutionDetectorApp
//
//  Created by Sri Vidya Vilipala on 4/2/25.
//

import UIKit
import AVFoundation

class WaterPollutionViewController: UIViewController {
    
    @IBOutlet weak var PHLevelOL: UITextField!
    
    @IBOutlet weak var DisslovedOxygenOL: UITextField!
    
    @IBOutlet weak var TurbidityOL: UITextField!
    
    @IBOutlet weak var TotalDisslovedSoilOL: UITextField!
    
    @IBOutlet weak var checkBtn: UIButton!
    
    @IBOutlet weak var resetBtn: UIButton!
    
    var PHLevel = 0.0
    var DisslovedOxygen = 0.0
    var Turbidity = 0.0
    var TotalDisslovedSoil = 0.0
    var result = ""
    var imgName = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkBtn.isEnabled = false
        resetBtn.isEnabled = false
    }
    
    @IBAction func QualityCheckBtn(_ sender: UIButton) {
        
        if let PHLevel = PHLevelOL.text, let DisslovedOxygen = DisslovedOxygenOL.text, let Turbidity = TurbidityOL.text, let TotalDisslovedSoil = TotalDisslovedSoilOL.text,
           Double(PHLevel) == nil || Double(DisslovedOxygen) == nil || Double(Turbidity) == nil || Double(TotalDisslovedSoil) == nil{
            
            //generate an alert saying invalid
            let alertController = UIAlertController(title: "Invalid Input⚠️", message: "Please enter valid numeric values for PHLevel, DisslovedOxygen, Turbidity.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            AudioServicesPlayAlertSound(1005)
            
            return
            
        }
        
        PHLevel = Double(PHLevelOL.text!)!
        DisslovedOxygen = Double(DisslovedOxygenOL.text!)!
        Turbidity = Double(TurbidityOL.text!)!
        TotalDisslovedSoil = Double(TotalDisslovedSoilOL.text!)!
        
        var pollutionScore = 0
        if PHLevel < 6.5 || PHLevel > 8.5 { pollutionScore += 1 }
            if DisslovedOxygen < 5 { pollutionScore += 1 }
            if Turbidity > 5 { pollutionScore += 1 }
            if TotalDisslovedSoil > 500 { pollutionScore += 1 }
        
        switch pollutionScore {
        case 0:
            result = "The WQC value is \(pollutionScore)\n"+"This is considered to be best👍 quality of water."
            imgName = "GoodWater"
        case 1:
            result = "The WQC value is \(pollutionScore)\n"+"This is considered to be Moderate⚠️ quality of water."
            imgName = "LowWater"
        case 2:
            result = "The WQC value is \(pollutionScore)\n"+"This is considered to be Poor☹️ quality of water."
             imgName = "BadWater"
                default:
            let alertController = UIAlertController(title: "Extreme Water Pollution‼️🚨", message: "Estimated Water Pollution Level. Immediate action recommended to relocate.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            AudioServicesPlayAlertSound(1322)
            return
                }
        AudioServicesPlaySystemSound(1156)
        performSegue(withIdentifier: "WaterQualitySegue", sender: self)
        
    }
    
    @IBAction func textField(_ sender: UITextField) {
        if !(PHLevelOL.text!.isEmpty) && !(DisslovedOxygenOL.text!.isEmpty) && !(TurbidityOL.text!.isEmpty) && !(TotalDisslovedSoilOL.text!.isEmpty) {
            checkBtn.isEnabled = true
            resetBtn.isEnabled = true
        } else {
            checkBtn.isEnabled = false
            resetBtn.isEnabled = false
        }
    }
    
    
    @IBAction func ResetBtn(_ sender: UIButton) {
        PHLevelOL.text! = ""
        DisslovedOxygenOL.text! = ""
        TurbidityOL.text! = ""
        TotalDisslovedSoilOL.text! = ""
        checkBtn.isEnabled = false
        resetBtn.isEnabled = false
        AudioServicesPlaySystemSound(1000)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
        // Reset all input fields
        PHLevelOL.text! = ""
        DisslovedOxygenOL.text! = ""
        TurbidityOL.text! = ""
        TotalDisslovedSoilOL.text! = ""
        checkBtn.isEnabled = false
        resetBtn.isEnabled = false
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "WaterQualitySegue" {
            var destination = segue.destination as! WaterQualityViewController
            destination.PHValue = PHLevel
            destination.disslovedOxy = DisslovedOxygen
            destination.turbidity = Turbidity
            destination.tdsValue = TotalDisslovedSoil
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


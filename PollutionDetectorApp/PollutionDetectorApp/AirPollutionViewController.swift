//
//  AirPollutionViewController.swift
//  PollutionDetectorApp
//
//  Created by Bhavani Kongari on 3/30/25.
//

import UIKit
import AVFoundation

class AirPollutionViewController: UIViewController {

    @IBOutlet weak var pm25OL: UITextField!
    
    @IBOutlet weak var pm10OL: UITextField!
    
    @IBOutlet weak var checkBtnOL: UIButton!
    
    @IBOutlet weak var resetBtnOL: UIButton!
    
    var pm25I = 0.0
    var pm10I = 0.0
    var resultI = ""
    var imgI = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkBtnOL.isEnabled = false
        resetBtnOL.isEnabled = false
    }
    
    
    @IBAction func QualityCheckBtnClicked(_ sender: UIButton) {
        
        if let pm25Text = pm25OL.text, let pm10Text = pm10OL.text,
           Double(pm25Text) == nil || Double(pm10Text) == nil {
            
            //generate an alert saying invalid
            let alertController = UIAlertController(title: "Invalid Input⚠️", message: "Please enter valid numeric values for pm2.5 and pm10.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            AudioServicesPlayAlertSound(1005)
            
            return
            
        }
        
        pm25I = Double(pm25OL.text!)!
        pm10I = Double(pm10OL.text!)!
        var calAirQuality = (pm25I+pm10I)/2
        
        if calAirQuality<50{
            resultI = "The AQC value is \(String(format: "%.1f", calAirQuality))\n"+"This is considered to be best👍 quality air."
            imgI = "GoodAir"
        }
        else if calAirQuality>=50 && calAirQuality<80{
            resultI = "The AQC value is \(String(format: "%.1f", calAirQuality))\n"+"This is considered to be moderate quality air😕."
            imgI = "MidAir"
        }
        else if calAirQuality>=80 && calAirQuality<110{
            resultI = "The AQC value is \(String(format: "%.1f", calAirQuality))\n"+"This is considered to be Poor quality air😕."
            imgI = "ExtremeAir"
        }
        else {
            let alertController = UIAlertController(title: "Extreme Air Pollution‼️🚨", message: "Estimated Air Pollution Level is \(String(format: "%.2f", calAirQuality)). Immediate action recommended to relocate.", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            AudioServicesPlayAlertSound(1322)
            return
        }
        performSegue(withIdentifier: "AirQualitySegue", sender: self)
    }

    
    @IBAction func textFeild(_ sender: UITextField) {
        if !(pm25OL.text!.isEmpty) && !(pm10OL.text!.isEmpty) {
            checkBtnOL.isEnabled = true
            resetBtnOL.isEnabled = true
        } else {
            checkBtnOL.isEnabled = false
            resetBtnOL.isEnabled = false
        }
    }
    
    @IBAction func ResetBtnClicked(_ sender: UIButton) {
        pm25OL.text! = ""
        pm10OL.text! = ""
        checkBtnOL.isEnabled = false
        resetBtnOL.isEnabled = false
        AudioServicesPlaySystemSound(1000)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var transition = segue.identifier
        if transition == "AirQualitySegue"{
            if let destination = segue.destination as? AirQualityViewController {
                destination.enteredpm25 = String(pm25I)
                destination.enteredpm10 = String(pm10I)
                destination.result = resultI
                destination.name = imgI
            }
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

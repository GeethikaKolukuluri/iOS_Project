//
//  AirPollutionViewController.swift
//  PollutionDetectorApp
//
//  Created by Bhavani Kongari on 3/30/25.
//

import UIKit

class AirPollutionViewController: UIViewController {

    @IBOutlet weak var pm25OL: UITextField!
    
    @IBOutlet weak var pm10OL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func QualityCheckBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func ResetBtnClicked(_ sender: UIButton) {
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

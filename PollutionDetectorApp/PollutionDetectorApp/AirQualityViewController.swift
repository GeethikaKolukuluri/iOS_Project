//
//  AirQualityViewController.swift
//  PollutionDetectorApp
//
//  Created by Bhavani Kongari on 3/30/25.
//

import UIKit

class AirQualityViewController: UIViewController {

    
    @IBOutlet weak var pm25label: UILabel!
    
    @IBOutlet weak var pm10label: UILabel!
    
    @IBOutlet weak var AirResultlabel: UILabel!
   
    
    @IBOutlet weak var imageView: UIImageView!
    
    var pm25 = ""
    var pm10 = ""
    var result = ""
    var img = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

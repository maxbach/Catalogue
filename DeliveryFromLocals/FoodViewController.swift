//
//  FoodViewController.swift
//  DeliveryFromLocals
//
//  Created by Максим Бачинский on 03.10.16.
//  Copyright © 2016 Max Bachinskiy. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {
    var cityName:String = ""
    var categoryName:String = ""

    @IBOutlet weak var buyButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buyButtonOutlet.setTitle("Buy " + categoryName + " in " + cityName , for: UIControlState.normal)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

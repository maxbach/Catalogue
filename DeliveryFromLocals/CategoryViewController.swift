//
//  CategoryViewController.swift
//  DeliveryFromLocals
//
//  Created by Максим Бачинский on 03.10.16.
//  Copyright © 2016 Max Bachinskiy. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    @IBOutlet weak var button1Outlet: UIButton!
    @IBOutlet weak var button2Outlet: UIButton!
    @IBOutlet weak var button3Outlet: UIButton!
    @IBOutlet weak var button4Outlet: UIButton!
    
    var cityName : String = ""
    var colorName = UIColor.black
    override func viewDidLoad() {
        button1Outlet.setTitle("Блюдо from " + cityName, for: UIControlState.normal) ;
        button1Outlet.backgroundColor = colorName
        button2Outlet.backgroundColor = colorName
        button3Outlet.backgroundColor = colorName
        button4Outlet.backgroundColor = colorName
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openFoodAction(_ sender: UIButton) {
        performSegue(withIdentifier: "CategoryToFoodSegue", sender: sender.titleLabel?.text)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "CategoryToFoodSegue" {
            // Проверяем, можно ли привести контроллер, который
            // появится на экране, к ожидаемому нами классу
            if let vc = segue.destination as? FoodViewController {
                // sender — объект типа Any?, поэтому нужно безопасно
                // распаковать его в ожидаемый тип
                if let title = sender as? String {
                    vc.title = title
                    vc.cityName = cityName
                    vc.categoryName = title // Заполняем значения создаваемого контроллера
                }
            }
        }
    }


}

//
//  ViewController.swift
//  DeliveryFromLocals
//
//  Created by Максим Бачинский on 03.10.16.
//  Copyright © 2016 Max Bachinskiy. All rights reserved.
//

import UIKit

class CitiesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Проверяем, какой из segue начинает выполнение
        // (т.к метод prepare вызывается каждый раз)
        if segue.identifier == "CityToCategorySegue" {
            // Проверяем, можно ли привести контроллер, который
            // появится на экране, к ожидаемому нами классу
            if let vc = segue.destination as? CategoryViewController {
                // sender — объект типа Any?, поэтому нужно безопасно
                // распаковать его в ожидаемый тип
                if let button = sender as? UIButton {
                    let title : String = (button.titleLabel?.text)!
                    vc.title = title
                    vc.cityName = title
                    vc.colorName = button.backgroundColor!
                }
                
            }
        }
    }

    @IBAction func openCategoriesAction(_ sender: UIButton) {
        performSegue(withIdentifier: "CityToCategorySegue", sender: sender);
    }

}


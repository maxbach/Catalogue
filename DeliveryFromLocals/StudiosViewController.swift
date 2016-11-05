//
//  ViewController.swift
//  DeliveryFromLocals
//
//  Created by Максим Бачинский on 03.10.16.
//  Copyright © 2016 Max Bachinskiy. All rights reserved.
//

import UIKit
import SwiftyJSON



class StudiosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    var cities: [String] = []
    var json:JSON = [:]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIndetifer")
        tableView.isScrollEnabled = true;
        title = "Blockbusters"
        
        if let path = Bundle.main.path(forResource: "text", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                json = JSON(data: data)
                if json != JSON.null {
                    let list:Array<JSON> = json["studios"].array!;
                    cities = list.map {
                        (item) -> String in
                        return item["name"].stringValue;
                    }
                    
                } else {
                    print("Could not get json from file, make sure that file contains valid json.")
                }
            } catch let error {
                print(error.localizedDescription)
            }
        } else {
            print("Invalid filename/path.")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StudioCell", for: indexPath) as! StudioTableViewCell
        
        let logoName : String = json["studios"][indexPath.row]["logo"].stringValue;
        cell.logoView.image = UIImage(named: logoName);
        
        return cell
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let i = tableView.indexPath(for: cell)?.row;
            if segue.identifier == "ShowFilms" {
                if let vc = segue.destination as? FilmViewController {
                    vc.city = i
                    vc.json = json["studios"][i!]
                    vc.title = json["studios"][i!]["name"].stringValue
                }
            }
        }
    }

    
    



}


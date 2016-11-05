//
//  CategoryViewController.swift
//  DeliveryFromLocals
//
//  Created by Максим Бачинский on 03.10.16.
//  Copyright © 2016 Max Bachinskiy. All rights reserved.
//

import UIKit
import SwiftyJSON

class FilmViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var city : Int? = -1;
    var json:JSON = [:];
    var films: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifier")
        tableView.isScrollEnabled = true;
        
        if json != JSON.null {
            let list:Array<JSON> = json["films"].array!;
            films = list.map {
                (item) -> String in
                return item["name"].stringValue;
            }
            
        } else {
            print("Could not get json from file, make sure that file contains valid json.")
        }
        
        
        
    }
    
    func tableView(_ tableView:UITableView, numberOfRowsInSection section:Int) -> Int
    {
        return films.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FilmCell", for: indexPath) as! FilmTableViewCell
        
        cell.filmLabel.text = self.films[indexPath.row]
        let posterName:String = json["films"][indexPath.row]["poster"].stringValue;
        cell.posterView.image = UIImage(named: posterName);
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell {
            let i = tableView.indexPath(for: cell)?.row;
            if segue.identifier == "ShowDescription" {
                if let vc = segue.destination as? DescriptionViewController {
                    vc.category = i!
                    vc.json = json["films"][i!]
                    vc.title = json["films"][i!]["name"].stringValue
                }
            }
        }
    }
    



}

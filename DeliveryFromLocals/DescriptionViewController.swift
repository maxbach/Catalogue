//
//  FoodViewController.swift
//  DeliveryFromLocals
//
//  Created by Максим Бачинский on 03.10.16.
//  Copyright © 2016 Max Bachinskiy. All rights reserved.
//

import UIKit
import SwiftyJSON
import YouTubePlayer

class DescriptionViewController: UIViewController {
    var category:Int = -1
    var json:JSON = [:]
    
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var descriptionView: UILabel!
    
    @IBOutlet var trailerView: YouTubePlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let posterName:String = json["poster"].stringValue;
        self.posterView.image = UIImage(named: posterName);
        self.descriptionView.text = json["description"].stringValue;
        let videoPath : String = json["trailer"].stringValue;
        let videoUrl : NSURL = NSURL(string: videoPath)!
        trailerView.loadVideoURL(videoURL: videoUrl)
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

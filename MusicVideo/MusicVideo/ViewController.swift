//
//  ViewController.swift
//  MusicVideo
//
//  Created by Kelvin Kosgei on 08/06/2016.
//  Copyright © 2016 Kelvin Kosgei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ViewController.reachabilityStatusChanged), name: "ReachStatusChanged", object: nil)
        
        reachabilityStatusChanged()
        
//        Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json", completion: didLoadData)
     
    }
    
    func didLoadData(videos: [Videos]) {
        
        print(reachabilityStatus)

        for item in videos{
            print("name = \(item.vName)")
        }
        
        for (index,item) in videos.enumerate() {
            print("\(index) artist = \(item.vArtist)")
        }
        
    }
    
    func reachabilityStatusChanged() {
        
        switch reachabilityStatus {
        case NOACCESS : view.backgroundColor = UIColor.redColor()
        displayLabel.text = "No Internet"
        case WIFI : view.backgroundColor = UIColor.greenColor()
        displayLabel.text = "Reachable With WIFI"
        case WWAN : view.backgroundColor = UIColor.yellowColor()
        displayLabel.text = "Reachable With Cellular"
        default:return
        }
    }
    
    //Called Just the object is about to be deallocated
    deinit
    {
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged",object: nil)
    }

    

}


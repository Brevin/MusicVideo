//
//  ViewController.swift
//  MusicVideo
//
//  Created by Kelvin Kosgei on 08/06/2016.
//  Copyright © 2016 Kelvin Kosgei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/us/rss/topmusicvideos/limit=10/json",
                     completion: didLoadData)
        
     
    }
    
    func didLoadData(result:String) {
        

        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction(title: "Ok", style : .Default) {
            action -> Void in
            
        }
        
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    

}


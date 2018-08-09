//
//  ViewController.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 9.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getEventList(success: { (events) in
            print(events)
        }, failure: { (error) in
            print(error)
        })
    }
    
    
    // Get messages from service
    func getEventList(success:@escaping ([Results]) -> Void, failure:@escaping (String) -> Void) {
        
        MySessionManager.sharedInstance.requestGETURL("/apps/api/events", success: { (responseJSON) in
            // Get json object from response
            let array = responseJSON["results"].arrayObject
            
            // Map json array to Array<Message> object
            guard let results:[Results] = Mapper<Results>().mapArray(JSONObject: array) else {
                failure("Error mapping response")
                return
            }
            
            // Send to object to calling controllers
            success(results)
            
        }, failure: { (error) in
            print(error)
        })
        
    }


}


//
//  AttendeesViewController.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 10.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit
import ObjectMapper

class AttendeesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.getAttendeesList(success: { (attendees) in
            print(attendees)
        }, failure: { (error) in
            print(error)
        })
    }

    // Get events from service
    func getAttendeesList(success:@escaping ([Results]) -> Void, failure:@escaping (String) -> Void) {
//        https://www.boomset.com/apps/api/events/:event_id/attendees?:page
        
        let url = "/apps/api/events/1/attendees?1"
        
        MySessionManager.sharedInstance.requestGETURL(url, success: { (responseJSON) in
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

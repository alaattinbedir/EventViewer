//
//  AttendeesViewController.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 10.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit
import ObjectMapper


class AttendeesViewController: UITableViewController {

    var selectedEvent: Event?
    var attendeesArray:[Atendees] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Attendees"
        
        setTableView()
        getAttendeesList()
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return self.attendeesArray.count
        return DBManager.sharedInstance.getDataFromAttendees().count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath as IndexPath) as! AttendeeCell
        
        let index = Int(indexPath.row)
        let attendee = DBManager.sharedInstance.getDataFromAttendees()[index] as Attendee
        
        cell.nameLabel.text = attendee.prefix + " " + attendee.firstName + " " + attendee.lastName
        cell.titleLabel.text = attendee.title
        cell.companyLabel.text = attendee.company
        
        return cell
    }
    
    func setTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        tableView.register(AttendeeCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func getAttendeesList() {
        let eventId = selectedEvent?.id
        Atendees.getAttendeesList(eventId!, success: { (attendees) in
            self.attendeesArray = attendees
            DBManager.sharedInstance.addBatchAttendeesData(objects: self.attendeesArray)
            
            // reload data to tableview on main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, failure: { (error) in
            print(error)
        })
    }

}

// Extension to Atendees model
extension Atendees {
    // Get attendees from service
    static func getAttendeesList(_ eventId:(Int) ,success:@escaping ([Atendees]) -> Void, failure:@escaping (String) -> Void) {
        
        let url = "/apps/api/events/\(eventId)/attendees?\(eventId)"
        
        MySessionManager.sharedInstance.requestGETURL(url, success: { (responseJSON) in
            // Get json object from response
            let array = responseJSON["results"].arrayObject
            
            // Map json array to Array<Atendees> object
            guard let results:[Atendees] = Mapper<Atendees>().mapArray(JSONObject: array) else {
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

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

class AttendeeCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .right
        return label
    }()
    
    let companyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16.0)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .left
        return label
    }()
    
    override func updateConstraints() {
        super.updateConstraints()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(nameLabel)
        addSubview(titleLabel)
        addSubview(companyLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        companyLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.left.equalTo(self).offset(15)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
    }
}

extension Atendees {
    // Get events from service
    static func getAttendeesList(_ eventId:(Int) ,success:@escaping ([Atendees]) -> Void, failure:@escaping (String) -> Void) {
        
        let url = "/apps/api/events/\(eventId)/attendees?\(eventId)"
        
        MySessionManager.sharedInstance.requestGETURL(url, success: { (responseJSON) in
            // Get json object from response
            let array = responseJSON["results"].arrayObject
            
            // Map json array to Array<Message> object
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

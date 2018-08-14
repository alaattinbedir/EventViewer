//
//  ViewController.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 9.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit
import ObjectMapper
import SnapKit

class EventsViewController: UITableViewController {

    var eventsArray:[Results] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Events"
        
        setTableView()
        getEventList()
    }
    
    fileprivate func setTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        tableView.register(EventCell.self, forCellReuseIdentifier: "cellId")
    }
    
    fileprivate func getEventList() {
        Events.getEventList(success: { (events) in
            self.eventsArray = events
            // reload data to tableview on main thread
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }, failure: { (error) in
            print(error)
        })
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventsArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath as IndexPath) as! EventCell
        cell.eventNameLabel.text = "Event"
        cell.eventDateLabel.text = "16.03.2018"
        
        return cell
    }
    
}


class EventCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let eventNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let eventDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setupViews() {
        addSubview(eventNameLabel)
        addSubview(eventDateLabel)
        
        eventNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)
        }
        
        eventDateLabel.snp.makeConstraints { (make) in
            make.top.equalTo(eventNameLabel.snp.bottom).offset(10)
            make.left.equalTo(self).offset(10)
            make.right.equalTo(self).offset(-10)
            make.height.equalTo(20)            
        }
        
    }
}

extension Events {
    
    // Get events from service
    static func getEventList(success:@escaping ([Results]) -> Void, failure:@escaping (String) -> Void) {
        
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


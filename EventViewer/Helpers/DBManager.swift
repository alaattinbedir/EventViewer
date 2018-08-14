//
//  DBManager.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 14.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit
import RealmSwift

public class DBManager {
    private var database: Realm
    static let sharedInstance = DBManager()
    private init() {
        database = try! Realm()
    }
    
    func getDataFromEvent() -> Results<Event> {
        let results: Results<Event> =   database.objects(Event.self)
        return results
    }
    
    func addEventData(object: Events) {
        try! database.write {
            let item = Event()
            
            if let name = object.name {
                item.name = name
            }
            
            let dateFormatterGet = DateFormatter()
            dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
            
            let dateFormatterPrint = DateFormatter()
            dateFormatterPrint.dateFormat = "MMM dd, yyyy"

            if let date = dateFormatterGet.date(from: object.endsat!){
                item.date = dateFormatterPrint.string(from: date)
            }
            else {
                print("There was an error decoding the string")
            }
            
            if let id = object.id {
                item.id = id
            }
            
            database.add(item, update: false)
            print("Added new event")
        }
    }
    
    func addBatchEventData(objects:[Events])  {
        for event in objects {
            addEventData(object: event)
        }
    }
    
    func deleteFromEvent(object: Event)   {
        try! database.write {
            database.delete(object)
        }
    }
    
    func getDataFromAttendees() -> Results<Attendee> {
        let results: Results<Attendee> =   database.objects(Attendee.self)
        return results
    }
    
    func addAttendeeData(object: Atendees) {
        try! database.write {
            let item = Attendee()
            
            if let prefix = object.contact?.prefix {
                item.prefix = prefix
            }
            
            if let firstName = object.contact?.firstName {
                item.firstName = firstName
            }
            
            if let lastName = object.contact?.lastName {
                item.lastName = lastName
            }
            
            if let title = object.workInfo?.title {
                item.title = title
            }
            
            if let company = object.workInfo?.company {
                item.company = company
            }
            
            database.add(item, update: false)
            print("Added new attendee")
        }
    }
    
    func addBatchAttendeesData(objects:[Atendees])  {
        for attendee in objects {
            addAttendeeData(object: attendee)
        }
    }
    
    func deleteFromAttendee(object: Attendee)   {
        try! database.write {
            database.delete(object)
        }
    }
    
    func deleteAllFromDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
    
}

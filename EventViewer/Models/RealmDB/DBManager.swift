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
            item.name = object.name!
            item.date = object.endsat!
            
            database.add(item, update: false)
            print("Added new event")
        }
    }
    
    func addBatchEventData(objects:[Events])  {
        for event in objects {
            addEventData(object: event)
        }
    }
    
    func deleteAllFromDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(object: Event)   {
        try! database.write {
            database.delete(object)
        }
    }
}

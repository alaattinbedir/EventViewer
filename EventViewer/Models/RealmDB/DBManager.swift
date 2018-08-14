//
//  DBManager.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 14.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import UIKit
import RealmSwift

class DBManager {
    private var database:Realm
    static let sharedInstance = DBManager()
    private init() {
        database = try! Realm()
    }
    
    func getDataFromEvent() ->  RealmSwift.Results<Event> {
        let results: RealmSwift.Results<Event> =   database.objects(Event.self)
        return results
    }
    
    func addEventData(object: Event)   {
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
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

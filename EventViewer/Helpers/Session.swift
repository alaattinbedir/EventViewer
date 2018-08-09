//
//  Session.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 9.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

class Session {
    
    var Authorization: String? = ""
    
    func getHeaders() -> [String: String] {
        let headers = [
            "Content-Type": "application/json",
            "X-API-Authentication" : "intervIEW_TOK3n"
        ]
        
        return headers
    }
    
    init() {
        
    }
    
    public class var sharedInstance: Session {
        struct Singleton {
            static let instance: Session = Session()
        }
        return Singleton.instance
    }
    
}


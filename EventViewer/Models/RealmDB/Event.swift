//
//  Event.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 14.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import Foundation
import RealmSwift

class Event: Object {
    @objc dynamic var name = ""
    @objc dynamic var date = ""
}

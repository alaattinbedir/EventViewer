//
//  Attendee.swift
//  EventViewer
//
//  Created by Alaattin Bedir on 14.08.2018.
//  Copyright © 2018 Magiclamp Games. All rights reserved.
//

import Foundation
import RealmSwift

class Attendee: Object {
    @objc dynamic var id = -1
    @objc dynamic var prefix = ""
    @objc dynamic var firstName = ""
    @objc dynamic var lastName = ""
    @objc dynamic var title = ""
    @objc dynamic var company = ""
}

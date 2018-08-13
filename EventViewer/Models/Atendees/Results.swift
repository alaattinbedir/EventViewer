//
//  Results.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Results: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let transaction = "transaction"
    static let modified = "modified"
    static let created = "created"
    static let id = "id"
    static let answers = "answers"
    static let contact = "contact"
    static let total = "total"
    static let quantity = "quantity"
    static let checkinInfo = "checkin_info"
    static let workInfo = "work_info"
    static let paid = "paid"
  }

  // MARK: Properties
  public var transaction: Transaction?
  public var modified: String?
  public var created: String?
  public var id: Int?
  public var answers: [Answers]?
  public var contact: Contact?
  public var total: String?
  public var quantity: Int?
  public var checkinInfo: [CheckinInfo]?
  public var workInfo: WorkInfo?
  public var paid: Int?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    transaction <- map[SerializationKeys.transaction]
    modified <- map[SerializationKeys.modified]
    created <- map[SerializationKeys.created]
    id <- map[SerializationKeys.id]
    answers <- map[SerializationKeys.answers]
    contact <- map[SerializationKeys.contact]
    total <- map[SerializationKeys.total]
    quantity <- map[SerializationKeys.quantity]
    checkinInfo <- map[SerializationKeys.checkinInfo]
    workInfo <- map[SerializationKeys.workInfo]
    paid <- map[SerializationKeys.paid]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = transaction { dictionary[SerializationKeys.transaction] = value.dictionaryRepresentation() }
    if let value = modified { dictionary[SerializationKeys.modified] = value }
    if let value = created { dictionary[SerializationKeys.created] = value }
    if let value = id { dictionary[SerializationKeys.id] = value }
    if let value = answers { dictionary[SerializationKeys.answers] = value.map { $0.dictionaryRepresentation() } }
    if let value = contact { dictionary[SerializationKeys.contact] = value.dictionaryRepresentation() }
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = quantity { dictionary[SerializationKeys.quantity] = value }
    if let value = checkinInfo { dictionary[SerializationKeys.checkinInfo] = value.map { $0.dictionaryRepresentation() } }
    if let value = workInfo { dictionary[SerializationKeys.workInfo] = value.dictionaryRepresentation() }
    if let value = paid { dictionary[SerializationKeys.paid] = value }
    return dictionary
  }

}

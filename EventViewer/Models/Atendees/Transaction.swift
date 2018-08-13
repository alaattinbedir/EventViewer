//
//  Transaction.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Transaction: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let total = "total"
    static let restype = "restype"
    static let amount = "amount"
    static let fee = "fee"
  }

  // MARK: Properties
  public var total: String?
  public var restype: Restype?
  public var amount: String?
  public var fee: String?

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
    total <- map[SerializationKeys.total]
    restype <- map[SerializationKeys.restype]
    amount <- map[SerializationKeys.amount]
    fee <- map[SerializationKeys.fee]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = total { dictionary[SerializationKeys.total] = value }
    if let value = restype { dictionary[SerializationKeys.restype] = value.dictionaryRepresentation() }
    if let value = amount { dictionary[SerializationKeys.amount] = value }
    if let value = fee { dictionary[SerializationKeys.fee] = value }
    return dictionary
  }

}

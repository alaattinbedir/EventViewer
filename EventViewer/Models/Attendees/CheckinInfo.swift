//
//  CheckinInfo.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation
import ObjectMapper

public class CheckinInfo: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let timestamp = "timestamp"
    static let quantity = "quantity"
    static let source = "source"
  }

  // MARK: Properties
  public var timestamp: String?
  public var quantity: Int?
  public var source: String?

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
    timestamp <- map[SerializationKeys.timestamp]
    quantity <- map[SerializationKeys.quantity]
    source <- map[SerializationKeys.source]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = timestamp { dictionary[SerializationKeys.timestamp] = value }
    if let value = quantity { dictionary[SerializationKeys.quantity] = value }
    if let value = source { dictionary[SerializationKeys.source] = value }
    return dictionary
  }

}

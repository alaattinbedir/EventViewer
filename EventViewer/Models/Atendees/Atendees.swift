//
//  Atendees.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Atendees: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let results = "results"
    static let count = "count"
  }

  // MARK: Properties
  public var results: [Results]?
  public var count: Int?

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
    results <- map[SerializationKeys.results]
    count <- map[SerializationKeys.count]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
    if let value = count { dictionary[SerializationKeys.count] = value }
    return dictionary
  }

}

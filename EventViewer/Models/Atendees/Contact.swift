//
//  Contact.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Contact: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let lastName = "last_name"
    static let email = "email"
    static let firstName = "first_name"
    static let prefix = "prefix"
  }

  // MARK: Properties
  public var lastName: String?
  public var email: String?
  public var firstName: String?
  public var prefix: String?

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
    lastName <- map[SerializationKeys.lastName]
    email <- map[SerializationKeys.email]
    firstName <- map[SerializationKeys.firstName]
    prefix <- map[SerializationKeys.prefix]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = lastName { dictionary[SerializationKeys.lastName] = value }
    if let value = email { dictionary[SerializationKeys.email] = value }
    if let value = firstName { dictionary[SerializationKeys.firstName] = value }
    if let value = prefix { dictionary[SerializationKeys.prefix] = value }
    return dictionary
  }

}

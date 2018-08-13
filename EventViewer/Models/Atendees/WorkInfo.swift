//
//  WorkInfo.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation

public class WorkInfo: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let phone = "phone"
    static let fax = "fax"
    static let title = "title"
    static let company = "company"
    static let blog = "blog"
    static let website = "website"
  }

  // MARK: Properties
  public var phone: String?
  public var fax: String?
  public var title: String?
  public var company: String?
  public var blog: String?
  public var website: String?

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
    phone <- map[SerializationKeys.phone]
    fax <- map[SerializationKeys.fax]
    title <- map[SerializationKeys.title]
    company <- map[SerializationKeys.company]
    blog <- map[SerializationKeys.blog]
    website <- map[SerializationKeys.website]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = phone { dictionary[SerializationKeys.phone] = value }
    if let value = fax { dictionary[SerializationKeys.fax] = value }
    if let value = title { dictionary[SerializationKeys.title] = value }
    if let value = company { dictionary[SerializationKeys.company] = value }
    if let value = blog { dictionary[SerializationKeys.blog] = value }
    if let value = website { dictionary[SerializationKeys.website] = value }
    return dictionary
  }

}

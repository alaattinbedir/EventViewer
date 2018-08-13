//
//  Answers.swift
//
//  Created by Alaattin Bedir on 13.08.2018
//  Copyright (c) . All rights reserved.
//

import Foundation

public class Answers: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let answer = "answer"
    static let optionId = "option_id"
    static let questionId = "question_id"
    static let question = "question"
  }

  // MARK: Properties
  public var answer: String?
  public var optionId: Int?
  public var questionId: Int?
  public var question: String?

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
    answer <- map[SerializationKeys.answer]
    optionId <- map[SerializationKeys.optionId]
    questionId <- map[SerializationKeys.questionId]
    question <- map[SerializationKeys.question]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = answer { dictionary[SerializationKeys.answer] = value }
    if let value = optionId { dictionary[SerializationKeys.optionId] = value }
    if let value = questionId { dictionary[SerializationKeys.questionId] = value }
    if let value = question { dictionary[SerializationKeys.question] = value }
    return dictionary
  }

}

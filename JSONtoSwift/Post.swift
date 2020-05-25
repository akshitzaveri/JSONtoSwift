//
//  Post.swift
//  JSONtoSwift
//
//  Created by Akshit Zaveri on 25/05/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import Foundation

struct Post {
  let userID, id: String
  let title, body: String
}

extension Post: Decodable {
  enum CodingKeys: String, CodingKey {
    case userID = "userId"
    case id, title, body
  }
}

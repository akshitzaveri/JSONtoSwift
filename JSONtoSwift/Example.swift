//
//  Example.swift
//  JSONtoSwift
//
//  Created by Akshit Zaveri on 25/05/20.
//  Copyright © 2020 Akshit Zaveri. All rights reserved.
//

import Foundation
import Alamofire

final class URLSessionExample {

  func getPosts(_ completion: @escaping ([Post]) -> Void) {
    let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
    let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
      guard let data = data else { return completion([]) }
      do {
        let posts = try JSONDecoder().decode([Post].self, from: data)
        completion(posts)
      } catch {
        print(error)
        completion([])
      }
    })
    task.resume()
  }
}

final class AlamofireExample {

  func getPosts(_ completion: @escaping ([Post]) -> Void) {
    let url = URL(string: "http://jsonplaceholder.typicode.com/posts")!
    AF.request(url)
      .responseDecodable(of: [Post].self) { (response) in
        guard let posts = response.value else { return completion([]) }
        completion(posts)
    }
  }
}

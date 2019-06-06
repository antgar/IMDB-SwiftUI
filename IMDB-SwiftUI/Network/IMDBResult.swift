//
//  IMDBResult.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 05/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation

struct IMDBResult<T: Decodable>: Decodable {
    let results: [T]
}

//
//  Movie.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 05/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI

struct Movie: Decodable {
    let title: String
    let overview: String
}

#if DEBUG
var movieData = [Movie(title: "Avengers", overview: "zeofhezohfoiezhfoeizf"),
                           Movie(title: "John Wick", overview: "ezofhozeifhoizehfoezihfhezfhezofihezoi")]
#endif


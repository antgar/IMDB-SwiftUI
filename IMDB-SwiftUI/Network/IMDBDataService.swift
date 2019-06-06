//
//  IMDBAPI.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 05/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Combine
import Moya

final class IMDBDataService {
    private let provider = MoyaProvider<IMDBService>()
    
    func getPopular() -> AnyPublisher<[Movie], Error> {
        provider.combine.request(.popular)
        .decode(IMDBResult<Movie>.self)
        .map {$0.results}
        .eraseToAnyPublisher()
    }
}

//
//  IMDBService.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 05/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Moya

enum IMDBService {
    case popular
}

extension IMDBService: TargetType {
    var apiKey:String {
        return "739eed14bc18a1d6f5dacd1ce6c2b29e"
    }
    var baseURL: URL {
        return URL(string:"https://api.themoviedb.org/3")!
    }
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        }
    }
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestParameters(parameters: ["api_key":apiKey], encoding: URLEncoding.default)
    }
    
    var headers: [String : String]? {
        return nil
    }
}

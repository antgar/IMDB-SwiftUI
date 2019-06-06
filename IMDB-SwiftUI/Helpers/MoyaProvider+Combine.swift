//
//  Moya+Combine.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 05/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import Moya
import Combine

extension MoyaProvider: CombineCompatible {}

extension CombineExtension where Base: MoyaProviderType {
    func request(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> AnyPublisher<Response, MoyaError> {
        AnyPublisher<Response, MoyaError> {[weak base] subscriber in
            base?.request(token, callbackQueue: callbackQueue, progress: nil) { result in
                switch result {
                case .success(let response):
                    subscriber.receive(response)
                    subscriber.receive(completion: .finished)
                case .failure(let error):
                    subscriber.receive(completion: .failure(error))
                }
            }
        }
    }
}

extension Publisher where Output == Response{
    func decode<T: Decodable>(_ type: T.Type) -> AnyPublisher<T, Error>{
        tryMap {upstream in
            try upstream.map(type)
        }.eraseToAnyPublisher()
    }
}

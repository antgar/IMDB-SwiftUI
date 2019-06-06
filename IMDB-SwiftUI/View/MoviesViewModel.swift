//
//  MoviesViewModel.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 06/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class MoviesViewModel: BindableObject {
    private let movieAPI = IMDBDataService()
    var didChange = PassthroughSubject<MoviesViewModel, Never>()
    private lazy var moviesAssign = Subscribers.Assign(object: self, keyPath: \.movies)
    private(set) var movies: [Movie] = [] {
        didSet {
            DispatchQueue.main.async {
                self.didChange.send(self)
            }
        }
    }
    
    init() {
        movieAPI.getPopular()
        .replaceError(with: [])
        .receive(subscriber: moviesAssign)
    }
}

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
    var cancellable: Cancellable?
    let didChange = PassthroughSubject<Void, Never>()
    private(set) var movies: [Movie] = [] {
        didSet {
            self.didChange.send(())
        }
    }
    
    init() {
        cancellable = movieAPI.getPopular()
        .replaceError(with: [])
        .assign(to: \.movies, on: self)
    }
}

//
//  ContentView.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 05/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct MoviesView : View {
    @EnvironmentObject private var viewModel: MoviesViewModel
    var body: some View {
        List {
            ForEach(viewModel.movies.identified(by: \.title)) {movie in
                MovieCell(movie: movie)
            }
        }
    }
}

#if DEBUG
struct MoviesView_Previews : PreviewProvider {
    static var previews: some View {
        MoviesView().environmentObject(MoviesViewModel())
    }
}
#endif

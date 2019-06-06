//
//  MovieCell.swift
//  IMDB-SwiftUI
//
//  Created by Antoine Garcia on 06/06/2019.
//  Copyright © 2019 antgar. All rights reserved.
//

import SwiftUI

struct MovieCell : View {
    let movie: Movie
    var body: some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(movie.overview)
            .lineLimit(nil)
            .font(.body)
        }
    }
}

#if DEBUG
struct MovieCell_Previews : PreviewProvider {
    static var previews: some View {
        MovieCell(movie: movieData[0])
    }
}
#endif

//
//  MovieDetailViewModel.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import Foundation

protocol MovieDetailViewProtocol {
    func getMovieInfoModel() -> MovieInfo?
}

class MovieDetailViewModel {
    // MARK: - Properties
    private var movieInfoModel: MovieInfo?
    
    // MARK: - Initilizer
    init(movieInfo: MovieInfo) {
        movieInfoModel = movieInfo
    }
    
}

extension MovieDetailViewModel: MovieDetailViewProtocol {
    func getMovieInfoModel() -> MovieInfo? {
        return movieInfoModel
    }
}

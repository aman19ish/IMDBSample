//
//  MovieListingViewModel.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import Foundation

protocol MovieListingViewProtocol {
    func getNumberOfRaws(in section: Int) -> Int
    func getMovieInfoModel(at indexPath: IndexPath) -> MovieInfo?
    var delegate: MovieListingViewDeleagte? { get set }
}

// We Can improve this code by using closure
protocol MovieListingViewDeleagte: AnyObject {
    func refreshTableView()
    func showError(errorMessage: String)
}

class MovieListingViewModel {
    // MARK: - Properties
    weak var delegate: MovieListingViewDeleagte?
    private var movieListing: MovieListing?
    private lazy var apiRepository = MovieListViewAPIRepository()

    // MARK: - Initilizer
    init() {
        getImageListData()
    }
    
    private func getImageListData() {
        apiRepository.getMovieListing { [weak self] (movieListing, errorString) in
            if let errorString = errorString {
                self?.delegate?.showError(errorMessage: errorString)
                return
            }
            if let model = movieListing {
                self?.movieListing = model
                self?.delegate?.refreshTableView()
                return
            } else {
                self?.delegate?.showError(errorMessage: "Unkown")
                return
            }
        }
    }
    
}

// MARK: - TableView Helper Methods
extension MovieListingViewModel: MovieListingViewProtocol {
    func getNumberOfRaws(in section: Int) -> Int {
        return movieListing?.movieInfoArray?.count ?? 0
    }
    
    func getMovieInfoModel(at indexPath: IndexPath) -> MovieInfo? {
        return movieListing?.movieInfoArray?[indexPath.row]
    }
    
}

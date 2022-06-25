//
//  MovieListViewAPIRepository.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import Foundation

class MovieListViewAPIRepository {
    // MARK: - API Call's
    func getMovieListing(completion: ((_ movieListing: MovieListing?,
        _ error: String?) -> Void)?) {
        do {
            if let url = Bundle.main.url(forResource: "Movies", withExtension: "json") {
                if let data = try? Data(contentsOf: url) {
                    let model = try JSONDecoder().decode(MovieListing.self, from: data)
                    completion?(model, nil)
                }
            }
        } catch {
            completion?(nil, error.localizedDescription)
        }
    }
    
}

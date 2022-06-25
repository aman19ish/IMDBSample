//
//  MovieListing+TableView.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import UIKit

// MARK: - Setup TableView
extension MovieListingViewController {
    func setUpTableView() {
        registerCells()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: "MovieListingTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieListingTableViewCell")
    }
}

// MARK: - UITableViewDataSource Methods
extension MovieListingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRaws(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListingTableViewCell",
                                                       for: indexPath) as? MovieListingTableViewCell else { return UITableViewCell() }
        
        cell.movieModel = viewModel.getMovieInfoModel(at: indexPath)
        return cell
    }
    
}

// MARK: - UITableViewDelegate Methods
extension MovieListingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let movieInfoModel = viewModel.getMovieInfoModel(at: indexPath), let controller = MovieDetailViewController.initilizMovieDetailView(movieIndoModel: movieInfoModel) {
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
}

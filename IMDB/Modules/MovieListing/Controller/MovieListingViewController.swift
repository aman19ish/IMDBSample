//
//  MovieListingViewController.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import UIKit

class MovieListingViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    var viewModel: MovieListingViewProtocol = MovieListingViewModel()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - ConfigureView
    func configureView() {
        title = "IMDB"
        viewModel.delegate = self
    }
    
}

extension MovieListingViewController: MovieListingViewDeleagte {
    func refreshTableView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showError(errorMessage: String) {
        showAlertWithHandlers(messageText: errorMessage, cancelCompletion: nil, okCompletion: nil)
    }
    
}

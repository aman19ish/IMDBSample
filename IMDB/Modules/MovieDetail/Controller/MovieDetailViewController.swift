//
//  MovieDetailViewController.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import UIKit

class MovieDetailViewController: BaseViewController {
    // MARK: - Outlets
    @IBOutlet weak var overViewLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var popularityLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    // MARK: - Properties
    var viewModel: MovieDetailViewProtocol?
    
    // MARK: - Initilizer
    static func initilizMovieDetailView(movieIndoModel: MovieInfo) -> MovieDetailViewController? {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        if let controller = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
            controller.viewModel = MovieDetailViewModel(movieInfo: movieIndoModel)
            return controller
        }
        return nil
    }
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    // MARK: - Action Methods
    func configureView() {
        movieImageView.layer.cornerRadius = 7.0
        movieImageView.layer.masksToBounds = true

        if let model = viewModel?.getMovieInfoModel() {
            title = model.title
            overViewLabel.text = model.overview
            popularityLabel.text = "\(model.popularity ?? 0.0)"
            ratingLabel.text = "\(model.voteAverage ?? 0.0)"
            releaseDateLabel.text = model.releaseDate
            movieImageView.image = UIImage(named: "placeHolderImage")
            
            if let previewURL = model.posterPath {
                let imageUrl = "\(ImageManager.baseURL)\(previewURL)"
                ImageManager.shared.downloadImage(imageURL: imageUrl) { [weak self] (imageURL, image) in
                    if imageURL == imageUrl, let image = image {
                        DispatchQueue.main.async {
                            self?.movieImageView.image = image
                        }
                    }
                }
            }
        }
    }
    
}

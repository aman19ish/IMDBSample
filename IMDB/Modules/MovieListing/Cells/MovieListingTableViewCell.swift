//
//  MovieListingTableViewCell.swift
//  IMDB
//
//  Created by Aman gupta on 25/06/22.
//

import UIKit

class MovieListingTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    // MARK: - Properties
    var movieModel: MovieInfo? {
        didSet {
            if let model = movieModel {
                titleLabel.text = model.title
                subtitleLabel.text = model.overview
                movieImageView.image = UIImage(named: "placeHolderImage")
                if let previewURL = model.backdropPath {
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
    
    // MARK: - Cell Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImageView.layer.cornerRadius = 5.0
        movieImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}

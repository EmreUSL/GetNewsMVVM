//
//  MainNewsTableViewCell.swift
//  GetNewsMVVM
//
//  Created by emre usul on 22.01.2023.
//

import UIKit
import Kingfisher

class MainNewsTableViewCell: UITableViewCell {
    

    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.layer.cornerRadius = 5
        contentView.layoutIfNeeded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(newsModel: Article) {
        titleLabel.text = newsModel.title
        descriptionLabel.text = newsModel.description
        
        guard let url = newsModel.urlToImage else {
            return
        }
        DispatchQueue.main.async {
            self.newsImageView.kf.setImage(with: URL(string: url))
        }
       
    }
    
}

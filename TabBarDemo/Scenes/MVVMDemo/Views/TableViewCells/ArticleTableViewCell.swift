//
//  ArticleTableViewCell.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    var viewModel: MVVMArticleCellViewModel? {
        
        willSet {
            titleLabel.text = newValue?.getTitleText() ?? ""
            descriptionLabel.text = newValue?.getDescriptionText() ?? ""
        }
    }
}

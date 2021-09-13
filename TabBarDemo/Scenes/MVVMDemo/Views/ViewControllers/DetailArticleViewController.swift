//
//  DetailArticleViewController.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 11/09/2021.
//

import UIKit

class DetailArticleViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newsKeywordsLabel: UILabel!
    @IBOutlet weak var instrumentsLabel: UILabel!
    @IBOutlet weak var tagsLabel: UILabel!
    @IBOutlet weak var categoriesLabels: UILabel!
    
    var viewModel = MVVMDetailArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //note I would normally implement an image loading service in the service layer but ran out of time
    
    func setupUI() {
        if let url = viewModel.getMainImageUrl() {
            mainImageView.load(url: url)
        }
        titleLabel.text = viewModel.getTitleText()
        descriptionLabel.text = viewModel.getDescriptionText()
        newsKeywordsLabel.text = viewModel.getNewsKeywordsText()
        instrumentsLabel.text = viewModel.getInstrumentsText()
        tagsLabel.text = viewModel.getTagsText()
        categoriesLabels.text = viewModel.getCategoriesText()
        
    }
}

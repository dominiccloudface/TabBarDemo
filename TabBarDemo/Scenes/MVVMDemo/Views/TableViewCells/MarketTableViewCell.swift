//
//  MarketTableViewCell.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class MarketTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var viewModel: MVVMMarketCellViewModel? {
        
        willSet {
            nameLabel.text = newValue?.getNameText() ?? "poo"
        }
    }
}

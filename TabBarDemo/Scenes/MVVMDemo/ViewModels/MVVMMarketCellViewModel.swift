//
//  MVVMMarketCellViewModel.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class MVVMMarketCellViewModel: NSObject {
    
    // the model
    var market: Currency!
    
    func getNameText() -> String {
        return market.displayName
    }
    
}

//
//  MVVMMarketsViewModel.swift
//  TabBarDemo
//
//  Created by Dominic Wood on 10/09/2021.
//

import UIKit

class MVVMMarketsViewModel: NSObject {
    
    var model = MVVMMarketsModel()
    
    func getCellHeight() -> CGFloat {
        64.0
    }
    
    func getMarketFor(indexPath: IndexPath) -> Currency{
        return model.markets[indexPath.row]
    }
}

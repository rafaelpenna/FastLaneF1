//
//  LastResultCellViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 02/08/23.
//

import Foundation
import UIKit

class LastResultCustomCellViewModel {
    
    private var data: LastResult
    
    init(data:LastResult){
        self.data = data
    }
    
    public var getDriversPosition: String {
        return "\(data.positionText)°"
    }
    
    public var getDriversCode: String {
        return data.driver.code
    }
    
    public var getPoints: String {
        return data.points
    }
}

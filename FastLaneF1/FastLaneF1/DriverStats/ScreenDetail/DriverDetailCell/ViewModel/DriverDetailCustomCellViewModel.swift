//
//  DriverDetailCustomCellViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverDetailCustomCellViewModel {
    
    private var data: DriverDetailRace
    
    init(data:DriverDetailRace){
        self.data = data
    }
    
    public var getRound: String {
        return "Round \(data.round)"
    }
    
    public var getCountry: String {
        return data.circuit.location.country
    }
    
    public var getPoistion: String {
        return "\(data.results[0].position)°"
    }
    
    public var getPoints: String {
        return data.results[0].points
    }
}

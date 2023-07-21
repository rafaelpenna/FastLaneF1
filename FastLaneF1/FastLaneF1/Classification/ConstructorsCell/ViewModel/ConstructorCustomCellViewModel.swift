//
//  ConstructorCustomCellViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import UIKit

class ConstructorScreenViewModel {
    
    private var data: ConstructorStandingConstructorModel
    
    init(data:ConstructorStandingConstructorModel){
        self.data = data
    }
    
    public var getTeamsPosition: String {
        return "\(data.position)°"
    }
    
    public var getTeamsName: String {
        return data.constructor.name
    }
    
    public var getSeasonTeamsPoints: String {
        return data.points
    }
    
    public var getTeamsBackground: UIImage {
        if data.constructor.name == "Red Bull" {
            return UIImage(named: "redbullbackground") ?? UIImage()
        } else if data.constructor.name == "Mercedes" {
            return UIImage(named: "mercedesbackground") ?? UIImage()
        } else if data.constructor.name == "Aston Martin" {
            return UIImage(named: "astonmartinbackground") ?? UIImage()
        } else if data.constructor.name == "Ferrari" {
            return UIImage(named: "ferraribackground") ?? UIImage()
        } else if data.constructor.name == "McLaren" {
            return UIImage(named: "mclarenbackground") ?? UIImage()
        } else if data.constructor.name == "Alpine F1 Team" {
            return UIImage(named: "alpinebackground") ?? UIImage()
        } else if data.constructor.name == "Haas F1 Team" {
            return UIImage(named: "haasbackground") ?? UIImage()
        } else if data.constructor.name == "Williams" {
            return UIImage(named: "williamsbackground") ?? UIImage()
        } else if data.constructor.name == "AlphaTauri" {
            return UIImage(named: "alphatauribackground") ?? UIImage()
        } else if data.constructor.name == "Alfa Romeo" {
            return UIImage(named: "alfaromeobackground") ?? UIImage()
        }
        return UIImage()
    }
    
    public var getTeamsCar: UIImage {
        if data.constructor.name == "Red Bull" {
            return UIImage(named: "redbullcar") ?? UIImage()
        } else if data.constructor.name == "Mercedes" {
            return UIImage(named: "mercedescar") ?? UIImage()
        } else if data.constructor.name == "Aston Martin" {
            return UIImage(named: "astonmartincar") ?? UIImage()
        } else if data.constructor.name == "Ferrari" {
            return UIImage(named: "ferraricar") ?? UIImage()
        } else if data.constructor.name == "McLaren" {
            return UIImage(named: "mclarencar") ?? UIImage()
        } else if data.constructor.name == "Alpine F1 Team" {
            return UIImage(named: "alpinecar") ?? UIImage()
        } else if data.constructor.name == "Haas F1 Team" {
            return UIImage(named: "haascar") ?? UIImage()
        } else if data.constructor.name == "Williams" {
            return UIImage(named: "williamscar") ?? UIImage()
        } else if data.constructor.name == "AlphaTauri" {
            return UIImage(named: "alphatauricar") ?? UIImage()
        } else if data.constructor.name == "Alfa Romeo" {
            return UIImage(named: "alfaromeocar") ?? UIImage()
        }
        return UIImage()
    }
}

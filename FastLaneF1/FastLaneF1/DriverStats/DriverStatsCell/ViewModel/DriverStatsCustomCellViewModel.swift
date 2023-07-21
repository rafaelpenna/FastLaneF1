//
//  DriverStatsCustomCellViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 21/07/23.
//

import UIKit

class DriverStatsCustomCellViewModel {
    
    private var data: DriverStandingDriversModel
    
    init(data:DriverStandingDriversModel){
        self.data = data
    }
    
    public var getDriversPosition: String {
        return "\(data.positionText)°"
    }
    
    public var getDriversPhoto: UIImage {
        if data.driver.familyName == "Verstappen" {
            return UIImage(named: "max") ?? UIImage()
        } else if data.driver.familyName == "Pérez" {
            return UIImage(named: "sergio") ?? UIImage()
        } else if data.driver.familyName == "Stroll" {
            return UIImage(named: "lance") ?? UIImage()
        } else if data.driver.familyName == "Sainz" {
            return UIImage(named: "carlos") ?? UIImage()
        } else if data.driver.familyName == "Russell" {
            return UIImage(named: "george") ?? UIImage()
        } else if data.driver.familyName == "Hamilton" {
            return UIImage(named: "lewis") ?? UIImage()
        } else if data.driver.familyName == "Alonso" {
            return UIImage(named: "fernando") ?? UIImage()
        } else if data.driver.familyName == "Ocon" {
            return UIImage(named: "esteban") ?? UIImage()
        } else if data.driver.familyName == "Gasly" {
            return UIImage(named: "pierre") ?? UIImage()
        } else if data.driver.familyName == "Norris" {
            return UIImage(named: "lando") ?? UIImage()
        } else if data.driver.familyName == "Hülkenberg" {
            return UIImage(named: "nico") ?? UIImage()
        } else if data.driver.familyName == "Piastri" {
            return UIImage(named: "oscar") ?? UIImage()
        } else if data.driver.familyName == "Bottas" {
            return UIImage(named: "valteri") ?? UIImage()
        } else if data.driver.familyName == "Zhou" {
            return UIImage(named: "guanyu") ?? UIImage()
        } else if data.driver.familyName == "Tsunoda" {
            return UIImage(named: "yuki") ?? UIImage()
        } else if data.driver.familyName == "Magnussen" {
            return UIImage(named: "kevin") ?? UIImage()
        } else if data.driver.familyName == "Albon" {
            return UIImage(named: "alexander") ?? UIImage()
        } else if data.driver.familyName == "de Vries" {
            return UIImage(named: "nyck") ?? UIImage()
        } else if data.driver.familyName == "Sargeant" {
            return UIImage(named: "logan") ?? UIImage()
        } else if data.driver.familyName == "Leclerc" {
            return UIImage(named: "charles") ?? UIImage()
        }
        return UIImage()
    }
    
    public var getDriversName: String {
        return data.driver.givenName
    }
    
    public var getDriversLastName: String {
        return data.driver.familyName
    }
    
    public var getTeamCar: UIImage {
        if data.constructors[0].name == "Red Bull" {
            return UIImage(named: "redbullcar") ?? UIImage()
        } else if data.constructors[0].name == "Mercedes" {
            return UIImage(named: "mercedescar") ?? UIImage()
        } else if data.constructors[0].name == "Aston Martin" {
            return UIImage(named: "astonmartincar") ?? UIImage()
        } else if data.constructors[0].name == "Ferrari" {
            return UIImage(named: "ferraricar") ?? UIImage()
        } else if data.constructors[0].name == "McLaren" {
            return UIImage(named: "mclarencar") ?? UIImage()
        } else if data.constructors[0].name == "Alpine F1 Team" {
            return UIImage(named: "alpinecar") ?? UIImage()
        } else if data.constructors[0].name == "Haas F1 Team" {
            return UIImage(named: "haascar") ?? UIImage()
        } else if data.constructors[0].name == "Williams" {
            return UIImage(named: "williamscar") ?? UIImage()
        } else if data.constructors[0].name == "AlphaTauri" {
            return UIImage(named: "alphatauricar") ?? UIImage()
        } else if data.constructors[0].name == "Alfa Romeo" {
            return UIImage(named: "alfaromeocar") ?? UIImage()
        }
        return UIImage()
    }
    
    public var getTeamsBackground: UIImage {
        if data.constructors[0].name == "Red Bull" {
            return UIImage(named: "redbullbackground") ?? UIImage()
        } else if data.constructors[0].name == "Mercedes" {
            return UIImage(named: "mercedesbackground") ?? UIImage()
        } else if data.constructors[0].name == "Aston Martin" {
            return UIImage(named: "astonmartinbackground") ?? UIImage()
        } else if data.constructors[0].name == "Ferrari" {
            return UIImage(named: "ferraribackground") ?? UIImage()
        } else if data.constructors[0].name == "McLaren" {
            return UIImage(named: "mclarenbackground") ?? UIImage()
        } else if data.constructors[0].name == "Alpine F1 Team" {
            return UIImage(named: "alpinebackground") ?? UIImage()
        } else if data.constructors[0].name == "Haas F1 Team" {
            return UIImage(named: "haasbackground") ?? UIImage()
        } else if data.constructors[0].name == "Williams" {
            return UIImage(named: "williamsbackground") ?? UIImage()
        } else if data.constructors[0].name == "AlphaTauri" {
            return UIImage(named: "alphatauribackground") ?? UIImage()
        } else if data.constructors[0].name == "Alfa Romeo" {
            return UIImage(named: "alfaromeobackground") ?? UIImage()
        }
        return UIImage()
    }
}

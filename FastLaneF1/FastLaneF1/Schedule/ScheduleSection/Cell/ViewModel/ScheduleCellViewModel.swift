//
//  ScheduleCellViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 18/07/23.
//

import UIKit

class ScheduleCellViewModel {
    
    private var data: RaceScheduleModel
    
    init(data:RaceScheduleModel){
        self.data = data
    }
    
    public var getRaceRound: String {
        return data.round
    }
    
    public var getRaceCountry: String {
        return data.circuit.location.country
    }
    
    public var getRaceDescription: String {
        return data.circuit.circuitName
    }
    
    public var startEventDay: String {
        if (Int(String(data.date.suffix(2))) ?? 00) - 2 >= 10 {
            return String((Int(data.date.suffix(2)) ?? 00) - 2)
        } else if String(data.date.suffix(5)) == "04-02" {
            return "31"
        } else if String(data.date.suffix(5)) == "07-02" {
            return "30"
        } else {
            return String("\(0)\((Int(data.date.suffix(2)) ?? 00) - 2)")
        }
    }
    
    public var getRaceDay: String {
        if Int(String(data.date.suffix(2))) ?? 00 >= 10 {
            return String(data.date.suffix(2))
        } else {
            return String("\(data.date.suffix(2))")
        }
    }
    
    public var getRaceMonthNumber: String {
        return String(data.date.prefix(7))
    }
    
    public var getRaceMonth: String {
        if String(data.date.suffix(5)) == "04-02" {
           return "MAR-APR"
        } else if String(data.date.suffix(5)) == "07-02" {
            return "JUN-JUL"
        } else if String(data.date.prefix(7)) == "2023-01" {
            return "JAN"
        } else if String(data.date.prefix(7)) == "2023-02" {
            return "FEB"
        } else if String(data.date.prefix(7)) == "2023-03" {
            return "MAR"
        } else if String(data.date.prefix(7)) == "2023-04" {
            return "APR"
        } else if String(data.date.prefix(7)) == "2023-05" {
            return "MAY"
        } else if String(data.date.prefix(7)) == "2023-06" {
            return "JUN"
        } else if String(data.date.prefix(7)) == "2023-07" {
            return "JUL"
        } else if String(data.date.prefix(7)) == "2023-08" {
            return "AUG"
        } else if String(data.date.prefix(7)) == "2023-09" {
            return "SEP"
        } else if String(data.date.prefix(7)) == "2023-10" {
            return "OCT"
        } else if String(data.date.prefix(7)) == "2023-11" {
            return "NOV"
        } else if String(data.date.prefix(7)) == "2023-12" {
            return "DEC"
        }
        return " "
    }
    
    public var getCoutryFlag: UIImage {
        if data.circuit.location.country == "Bahrain" {
            return UIImage(named: "bahrain") ?? UIImage()
        } else if data.circuit.location.country == "Saudi Arabia" {
            return UIImage(named: "saudiarabia") ?? UIImage()
        } else if data.circuit.location.country == "Australia" {
            return UIImage(named: "australia") ?? UIImage()
        } else if data.circuit.location.country == "Azerbaijan" {
            return UIImage(named: "azerbaijan") ?? UIImage()
        } else if data.circuit.location.country == "USA" || data.circuit.location.country == "United States" {
            return UIImage(named: "us") ?? UIImage()
        } else if data.circuit.location.country == "Monaco" {
            return UIImage(named: "monaco") ?? UIImage()
        } else if data.circuit.location.country == "Spain" {
            return UIImage(named: "spain") ?? UIImage()
        } else if data.circuit.location.country == "Canada" {
            return UIImage(named: "canada") ?? UIImage()
        } else if data.circuit.location.country == "Austria" {
            return UIImage(named: "austria") ?? UIImage()
        } else if data.circuit.location.country == "UK" {
            return UIImage(named: "uk") ?? UIImage()
        } else if data.circuit.location.country == "Hungary" {
            return UIImage(named: "hungary") ?? UIImage()
        } else if data.circuit.location.country == "Netherlands" {
            return UIImage(named: "netherland") ?? UIImage()
        } else if data.circuit.location.country == "Belgium" {
            return UIImage(named: "belgium") ?? UIImage()
        } else if data.circuit.location.country == "Italy" {
            return UIImage(named: "italy") ?? UIImage()
        } else if data.circuit.location.country == "Singapore" {
            return UIImage(named: "singapore") ?? UIImage()
        } else if data.circuit.location.country == "Japan" {
            return UIImage(named: "japan") ?? UIImage()
        } else if data.circuit.location.country == "Qatar" {
            return UIImage(named: "qatar") ?? UIImage()
        } else if data.circuit.location.country == "Mexico" {
            return UIImage(named: "mexico") ?? UIImage()
        } else if data.circuit.location.country == "Brazil" {
            return UIImage(named: "brazil") ?? UIImage()
        } else if data.circuit.location.country == "UAE" {
            return UIImage(named: "abudhabi") ?? UIImage()
        }
        return UIImage()
    }
}

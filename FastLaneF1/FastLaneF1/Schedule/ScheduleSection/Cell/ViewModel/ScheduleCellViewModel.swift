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
    
    public var getRaceDay: Int {
        return Int(String(data.date.suffix(2))) ?? 00
    }
    
    public var getRaceMonthNumber: String {
        return String(data.date.prefix(7))
    }
    
    public var getRaceMonth: String {
        if String(data.date.prefix(7)) == "2023-01" {
            return "JAN"
        } else if String(data.date.prefix(7)) == "2023-02" {
            return "FEV"
        } else if String(data.date.prefix(7)) == "2023-03" {
            return "MAR"
        } else if String(data.date.prefix(7)) == "2023-04" {
            return "ABR"
        } else if String(data.date.prefix(7)) == "2023-05" {
            return "MAI"
        } else if String(data.date.prefix(7)) == "2023-06" {
            return "JUN"
        } else if String(data.date.prefix(7)) == "2023-07" {
            return "JUL"
        } else if String(data.date.prefix(7)) == "2023-08" {
            return "AGO"
        } else if String(data.date.prefix(7)) == "2023-09" {
            return "SET"
        } else if String(data.date.prefix(7)) == "2023-10" {
            return "OUT"
        } else if String(data.date.prefix(7)) == "2023-11" {
            return "NOV"
        } else if String(data.date.prefix(7)) == "2023-12" {
            return "DEZ"
        }
        return " "
    }
}

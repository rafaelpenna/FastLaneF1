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
            return "31/03"
        } else if String(data.date.suffix(5)) == "07-02" {
            return "30/06"
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
        if String(data.date.prefix(7)) == "2023-01" {
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
}

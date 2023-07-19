//
//  ClassificationConstructorViewModel.swift
//  FastLaneF1
//
//  Created by Rafael Penna on 19/07/23.
//

import Foundation
import UIKit

enum ConstructorTypeFetch {
    case mock
    case request
}

protocol ConstructorViewModelProtocol: AnyObject {
    func reloadTableView()
}

protocol ConstructorViewModelDelegate: AnyObject {
    func success()
    func error(_ message: String)
}

class ClassificationConstructorViewModel {
    private var dataTeams:[ConstructorStandingConstructorModel] = []
    
    private let teamsService: ConstrcutorService = ConstrcutorService()
    private weak var delegate: ConstructorViewModelDelegate?
    
    public func delegate(delegate: ConstructorViewModelDelegate?) {
        self.delegate = delegate
    }
    
    public func fetchTeams(_ typeFetch: ConstructorTypeFetch){
        switch typeFetch {
        case .mock:
            self.teamsService.getConstructorDataFromJson(fromFileName: "seasonContructors") { success, error in
                if let success = success {
                    self.dataTeams = success.mrData.standingsTable.standingsLists[0].constructorStandings
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        case .request:
            self.teamsService.getConstructorData(fromURL: "https://ergast.com/api/f1/current/constructorStandings.json") { success, error in
                if let success = success {
                    self.dataTeams = success.mrData.standingsTable.standingsLists[0].constructorStandings
                    self.delegate?.success()
                } else {
                    self.delegate?.error(error?.localizedDescription ?? "")
                }
            }
        }
    }
    
    public var numberOfRowsTeams:Int{
        return dataTeams.count
    }
    
    public func loadCurrentTeam(indexPath: IndexPath) -> ConstructorStandingConstructorModel {
        return dataTeams[indexPath.row]
    }
    
    public func getTeamsPosition(indexPath: IndexPath) -> String {
        return dataTeams[indexPath.row].position
    }
    
    public func getTeamsName(indexPath: IndexPath) -> String {
        return dataTeams[indexPath.row].constructor.name
    }
    
    public func getTeamsSeasonPoints(indexPath: IndexPath) -> String {
        return dataTeams[indexPath.row].points
    }
}


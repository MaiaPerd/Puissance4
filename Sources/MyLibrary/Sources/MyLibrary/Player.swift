//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public class Player{
    
    public let nom: String
    
    public convenience init(){
        self.init(nom: "Player")
    }
    
    public init(nom: String) {
        self.nom = nom
    }
    
    public func choisirColonne(LeBoard board: Board, LaRegle regle: Rules)->Int?{
        return nil
    }
    
    
}

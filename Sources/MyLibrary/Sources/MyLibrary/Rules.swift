//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public protocol Rules{
    
    var nbColonnes: Int  { get }
    var nbLignes: Int { get }
    
    var nbPieceAlign: Int { get }
    
    func gameEnd(board:Board)->RulesEnum
    
}

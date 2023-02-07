//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public protocol Rules{
    
    static var nbColonnes: Int  { get }
    static var nbLignes: Int { get }
    
    static var nbPieceAlign: Int { get }
    
    func createBoard()-> Board
    
    func isValid(board: Board, newPieceColonne colonne: Int)->Bool
    
    func gameEnd(board: Board, newPiece colonne: Int)->RulesEnum
    
    func getNextPlayer(board: Board)->Int
    
}

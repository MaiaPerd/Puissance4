//
//  Board.swift
//  Puissance4
//
//  Created by Perderizet Maïa on 17/01/2023.
//

import Foundation

struct Board {
    
    let nbColonnes: Int
    let nbLignes: Int
    var grid: [[Int?]]
    
    init?(nbColonnes: Int, nbLignes: Int, grid: [[Int?]]) {
        if nbLignes <= 0 && nbLignes <= 0 {
            return nil
        }
        self.nbColonnes = nbColonnes
        self.nbLignes = nbLignes
        self.grid = grid
    }
    
    init?(nbColonnes: Int, nbLignes: Int) {
        if nbLignes <= 0 && nbLignes <= 0 {
            return nil
        }
        self.nbColonnes = nbColonnes
        self.nbLignes = nbLignes
        self.grid = Array(repeating: Array(repeating: nil, count: nbColonnes), count: nbLignes)
    }
    
    private mutating func insertPiece(id: Int, ligne: Int, colonne: Int)-> Bool{
        grid[ligne].insert(id, at: colonne)
        return true
    }
    
    public mutating func insertPiece(id: Int, colonne: Int)-> Bool{
        grid.append([id,colonne])
        return true
    }
    
    private func removePiece(id: Int, ligne: Int, colonne: Int)-> Bool{
        
        return true
    }
    
    public func isFail()->Bool{
        return true
    }
    
    
}
    
    

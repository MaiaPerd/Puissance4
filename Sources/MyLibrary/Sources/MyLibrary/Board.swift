//
//  Board.swift
//  Puissance4
//
//  Created by Perderizet Maïa on 17/01/2023.
//

import Foundation

public struct Board : CustomStringConvertible {
    
    public var description: String{
        var string = String()
        for l in grid.reversed(){
            string.append(" | ")
            for c in l {
                string.append("\((Board.descritionMapper[c]) ?? "-") | ")
            }
            string.append("\n")
        }
        return string
    }
    
    private static let descritionMapper: [Int?:String] = [nil:"-",1:"O",2:"X"]
    
    public let nbColonnes: Int
    public let nbLignes: Int
    var grid: [[Int?]]
    
    public init?(grid: [[Int?]]) {
        guard grid.count > 0 && grid[0].count > 0 else {
            return nil
        }
        let result = grid.allSatisfy { $0.count == grid[0].count }
        guard result else {
            return nil
        }
        self.nbColonnes = grid[0].count
        self.nbLignes = grid.count
        self.grid = grid
    }
    
    public init?(colonnes nbColonnes: Int, lignes nbLignes: Int) {
        guard nbLignes > 0 && nbColonnes > 0 else {
            return nil
        }
        self.nbColonnes = nbColonnes
        self.nbLignes = nbLignes
        self.grid = Array(repeating: Array(repeating: nil, count: nbColonnes), count: nbLignes)
    }
    
    private mutating func insertPiece(joueur id: Int, ligne: Int, colonne: Int)-> BoardEnum{
        guard (0..<nbLignes).contains(ligne) && (0..<nbColonnes).contains(colonne) else {
            return BoardEnum.failed
        }
        /*if (ligne <= 0 || ligne > nbLignes) &&  (colonne <= 0 || colonne > nbColonnes){
            return false
        }*/
        grid[ligne][colonne] = id
        return BoardEnum.ok
    }
    
    public mutating func insertPiece(id: Int, colonne: Int)-> BoardEnum{
        guard colonne > 0 && colonne < nbColonnes else {
            return BoardEnum.failed
        }
        for l in 0..<nbLignes{
            if grid[l][colonne] == nil{
                return insertPiece(joueur: id, ligne: l, colonne: colonne)
            }
        }
        return BoardEnum.failed
    }
    
    private mutating func removePiece(id: Int, ligne: Int, colonne: Int)-> BoardEnum{
        guard (0..<nbLignes).contains(ligne) && (0..<nbColonnes).contains(colonne) else {
            return BoardEnum.failed
        }
        if grid[ligne][colonne] == id {
            grid[ligne].remove(at: colonne)
        }
        return BoardEnum.ok
    }
    
    public func isFull()->Bool{
        for l in grid{
            for c in l {
                if c == nil {
                    return false
                }
            }
        }
        return true
    }
    
    public func subSript(ligne: Int, colonne: Int)-> Int? {
        guard (0..<nbLignes).contains(ligne) && (0..<nbColonnes).contains(colonne) else {
            return nil
        }
        return grid[ligne][colonne]
    }
    
}
    
    

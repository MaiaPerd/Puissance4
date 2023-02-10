//
//  Board.swift
//  Puissance4
//
//  Created by Perderizet Maïa on 17/01/2023.
//

import Foundation

///
/// Struct Board: Tableau du puissance 4
///
public struct Board : CustomStringConvertible {
    
    public var description: String{
        var string = String()
        string.append("\n")
        for l in grid.reversed(){
            string.append(" | ")
            for c in l {
                string.append("\((Board.descritionMapper[c]) ?? "-") | ")
            }
            string.append("\n")
        }
        for n in 1...grid.count+1{
            string.append("   \(n)")
        }
        string.append("\n")
        return string
    }
    
    private static let descritionMapper: [Int?:String] = [nil:"-",1:"O",2:"X"]
    
    /// Nombre de colonnes de la grille
    public let nbColonnes: Int
    /// Nombre de lignes de la grille
    public let nbLignes: Int
    /// La grille
    var grid: [[Int?]]
    
    ///
    /// Initializeur qui crée un board avec une grille déjà existante
    ///
    ///  # Parameter
    /// - grid:``[[Int?]]``
    ///
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
    
    ///
    /// Initializeur qui crée un board avec une grille qui a les dimention des variable en paramètre
    ///
    ///  # Parameter
    /// - nbColonnes: ``Int``
    /// - nbLignes: ``Int``
    ///
    public init?(colonnes nbColonnes: Int, lignes nbLignes: Int) {
        guard nbLignes > 0 && nbColonnes > 0 else {
            return nil
        }
        self.nbColonnes = nbColonnes
        self.nbLignes = nbLignes
        self.grid = Array(repeating: Array(repeating: nil, count: nbColonnes), count: nbLignes)
    }
    
    ///
    /// Insert une piece dans la grille
    ///
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
    
    ///
    /// Insert une piece dans la grille
    ///
    public mutating func insertPiece(id: Int, colonne: Int)-> BoardEnum{
        guard colonne >= 0 && colonne < nbColonnes else {
            return BoardEnum.failed
        }
        for l in 0..<nbLignes{
            if grid[l][colonne] == nil{
                return insertPiece(joueur: id, ligne: l, colonne: colonne)
            }
        }
        return BoardEnum.failed
    }
    
    ///
    /// Supprime une pièce de la grille
    ///
    private mutating func removePiece(id: Int, ligne: Int, colonne: Int)-> BoardEnum{
        guard (0..<nbLignes).contains(ligne) && (0..<nbColonnes).contains(colonne) else {
            return BoardEnum.failed
        }
        if grid[ligne][colonne] == id {
            grid[ligne].remove(at: colonne)
        }
        return BoardEnum.ok
    }
    
    ///
    /// Regarde si la grille est pleine, retourne vrai ou faux
    ///
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
    
    ///
    /// Regarde si la colonne de la grille est pleine, retourne vrai ou faux
    ///
    public func colonneIsFull(numColonne: Int)->Bool{
        return grid[nbLignes-1][numColonne] != nil
    }
    
    ///
    /// Retourne la valeur des cordonnées prix en paramètre
    ///
    public func subSript(ligne: Int, colonne: Int)-> Int? {
        guard (0..<nbLignes).contains(ligne) && (0..<nbColonnes).contains(colonne) else {
            return nil
        }
        return grid[ligne][colonne]
    }
    
    ///
    /// Retourne le nombre de pièce du joueur en paramètre
    ///
    public func nbJoueur(numJoueur: Int)->Int{
        var nb = 0
        for l in grid{
            for c in l {
                if c == numJoueur {
                    nb += 1
                }
            }
        }
        return nb
    }
    
}
    
    

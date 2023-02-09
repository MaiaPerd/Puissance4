//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 09/02/2023.
//

import Foundation

///
/// Class IALigne: hérite de IA
/// Cette classe est une IA qui va essayer de gagner en fessant une ligne
///
public class IALigne: IA {

    private var numPlayer: Int
    
    public init(numPlayer: Int){
        self.numPlayer = numPlayer
        super.init(nom: "IA colonne")
    }
    
    public init(nom: String, numPlayer: Int) {
        self.numPlayer = numPlayer
        super.init(nom: nom)
    }
    
    internal override func random(LeBoard board: Board, regle: Rules) -> Int?{
        for ligne in 0..<board.nbLignes{
            var nbPiecePosisible = Array<Int>()
            for colonne in 0..<(board.nbColonnes){
                if board.grid[ligne][colonne] == nil {
                    nbPiecePosisible.append(colonne)
                } else {
                    nbPiecePosisible = []
                }
                if nbPiecePosisible.count >= regle.nbPieceAlign {
                    return colonne - (regle.nbPieceAlign-1)
                }
            }
        }
    
        for colonne in 0..<board.nbColonnes{
            guard board.colonneIsFull(numColonne: colonne) else {
                return colonne
            }
        }
        return nil;
    }
    
}

//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 08/02/2023.
//

import Foundation

///
/// Class IAColonne: hérite de ``IA``
/// Cette classe est une IA qui va essayer de gagner en faisant une colonne
///
public class IAColonne: IA {

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
        for colonne in 0..<board.nbColonnes{
            var nbPiecePosisible = 0
            for ligne in 0..<board.nbLignes{
                if board.subSript(ligne: ligne, colonne: colonne) == nil{
                    nbPiecePosisible = nbPiecePosisible + 1
                }
            }
            if nbPiecePosisible >= regle.nbPieceAlign {
                return colonne
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

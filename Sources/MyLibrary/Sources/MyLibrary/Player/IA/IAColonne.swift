//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 08/02/2023.
//

import Foundation

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
        var res = 0
        for ligne in 0..<board.nbLignes{
            res = 0
            for colonne in 0..<board.nbColonnes{
                guard board.colonneIsFull(numColonne: colonne) else {
                    if board.grid[ligne][colonne] == numPlayer {
                        res += 1
                    }
              
                    return colonne
                }
            }
        }
       
        return nil;
    }
    
}

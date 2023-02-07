//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 29/01/2023.
//

import Foundation

public class IA: Player{
    
    public init(){
        super.init(nom: "IA")
    }
    
    public override init(nom: String) {
        super.init(nom: nom)
    }
    
    public override final func choisirColonne(LeBoard board: Board, LaRegle regle: Rules)->Int?{
        return random(LeBoard: board, regle: regle)
    }
    
    internal func random(LeBoard board: Board, regle: Rules) -> Int?{
        var r = Int.random(in: 0..<board.nbColonnes)
        if regle.isValid(board: board, newPieceColonne: r) {
            return r
        }
        return nil
    }
}

//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 31/01/2023.
//

import Foundation

///
/// Class IAColonneOrder: hérite de ``IA``
/// Cette classe est une IA qui joue dans la première colonne disponible en partant de la gauche
///
public class IAColonneOrder: IA {

    public override init(){
        super.init(nom: "IA colonne dans l'ordre")
    }
    
    public override init(nom: String) {
        super.init(nom: nom)
    }
    
    internal override func random(LeBoard board: Board, regle: Rules) -> Int?{
        for colonne in 0..<board.nbColonnes{
            guard board.colonneIsFull(numColonne: colonne) else {
                return colonne
            }
        }
        return nil;
    }
    
}

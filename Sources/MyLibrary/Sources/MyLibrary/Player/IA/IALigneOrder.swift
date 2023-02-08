//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 08/02/2023.
//

import Foundation


public class IALigneOrder: IA {
    
    private var colonne: Int

    public override init(){
        self.colonne = 0
        super.init(nom: "IA ligne dans l'ordre")
    }
    
    public override init(nom: String) {
        self.colonne = 0
        super.init(nom: nom)
    }
    
    internal override func random(LeBoard board: Board, regle: Rules) -> Int?{
        if colonne == board.nbColonnes{
            colonne = 0
        }
        var res: Int? = colonne
        for i in colonne..<board.nbColonnes{
            if board.colonneIsFull(numColonne: i) {
                if i == board.nbColonnes - 1 {
                    res = nil
                    break
                }
                if res != nil {
                    res = i
                }
            } else {
                break
            }
        }
        if res == nil {
            for i in 0..<colonne{
                if board.colonneIsFull(numColonne: i) {
                    res = i
                } else {
                    break
                }
            }
        }
        if res != nil {
            colonne = res! + 1
        }
        return res;
    }
    
}

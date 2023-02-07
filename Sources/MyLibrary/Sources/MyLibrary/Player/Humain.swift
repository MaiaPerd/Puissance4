//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 29/01/2023.
//

import Foundation

public class Humain: Player{
    
    let scanner: ()->Int
    
    public init(scanner: @escaping () -> Int){
        self.scanner = scanner
        super.init(nom: "Humain")
    }
    
    public init(nom: String, scanner: @escaping () -> Int) {
        self.scanner = scanner
        super.init(nom: nom)
    }
    
    public override func choisirColonne(LeBoard board: Board, LaRegle regle: Rules)->Int?{
        var s = scanner()
        if regle.isValid(board: board, newPieceColonne: s) {
            return s
        }
        return nil
    }
    
}

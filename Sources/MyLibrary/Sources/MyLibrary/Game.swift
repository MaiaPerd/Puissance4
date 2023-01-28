//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public struct Game{
    
    let joueur1: Player
    let joueur2: Player
    var board: Board
    
    init(joueur1: Player, joueur2: Player, board: Board) {
        self.joueur1 = joueur1
        self.joueur2 = joueur2
        self.board = board
    }
    
    
}

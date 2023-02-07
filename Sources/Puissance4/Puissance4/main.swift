//
//  main.swift
//  Puissance4
//
//  Created by Perderizet Maïa on 17/01/2023.
//

import Foundation
import MyLibrary

print("Puissance 4: \n")

var ba = BasicRule()

if var b = Board(grid: [[1,1,2,nil],[1,2,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil]]) {
    print(b)
    b.insertPiece(id: 1, colonne: 3)
    print(b)
}




func Scanner()->Int{
    print("Saisir le numéro de la colonne \n")
    var res: Int? = nil
    while(res==nil){
        var saisie = readLine(strippingNewline: true)
        if let s = saisie {
            res = Int(s) ?? nil
        }
    }
    return res! - 1
}

var basicRule = BasicRule()

var board = basicRule.createBoard()

var h = Humain(scanner: Scanner)

print(board)

var i = h.choisirColonne(LeBoard: board, LaRegle: basicRule)

if var piece = i{
    if basicRule.isValid(board: board, newPieceColonne: piece) {
        board.insertPiece(id: 1, colonne: piece)
    }
}


print(board)


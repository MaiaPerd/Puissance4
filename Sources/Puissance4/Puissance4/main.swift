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
    print(ba.gameEndTest(board: b))
}

if var b = Board(colonnes: 7, lignes: 6) {
    print(b)
    b.insertPiece(id: 1, colonne: 3)
 
    b.insertPiece(id: 2, colonne: 3)
    b.insertPiece(id: 1, colonne: 3)
    b.insertPiece(id: 2, colonne: 3)
    b.insertPiece(id: 1, colonne: 3)
    b.insertPiece(id: 2, colonne: 3)
    print(b)
    print(ba.gameEndTest(board: b))
    b.insertPiece(id: 2, colonne: 2)
    b.insertPiece(id: 1, colonne: 4)
    b.insertPiece(id: 2, colonne: 1)
    b.insertPiece(id: 1, colonne: 5)
    b.insertPiece(id: 1, colonne: 6)
    print(b)
    print(ba.gameEndTest(board: b))
    b.insertPiece(id: 2, colonne: 2)
    b.insertPiece(id: 2, colonne: 2)
    b.insertPiece(id: 2, colonne: 2)
    b.insertPiece(id: 1, colonne: 4)
    b.insertPiece(id: 2, colonne: 5)
    b.insertPiece(id: 1, colonne: 5)
    b.insertPiece(id: 2, colonne: 4)
    b.insertPiece(id: 2, colonne: 5)
    print(b)
    print(ba.gameEndTest(board: b))
}



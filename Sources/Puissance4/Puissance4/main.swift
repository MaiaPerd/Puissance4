//
//  main.swift
//  Puissance4
//
//  Created by Perderizet Maïa on 17/01/2023.
//

import Foundation
import MyLibrary

print("Puissance 4: \n")

func Scanner()->Int{
    var res: Int? = nil
    while(res==nil){
        print("Saisir le numéro de la colonne \n")
        let saisie = readLine(strippingNewline: true)
        if let s = saisie {
            res = Int(s) ?? nil
        }
        if res == nil {
            print("Saisie incorrect")
        }
    }
    return res! - 1
}

func Affiche(Afficher chaine: String){
    print(chaine)
}

func AfficheBoard(LeBoard board: Board){
    print(board)
}

var basicRule = BasicRule()

var h = Humain(scanner: Scanner)

var ia = IA()

var ia2 = IAColonneOrder()

var ia3 = IALigneOrder()

var game = Game(joueur1: h, joueur2: h, regle: basicRule, afficheur: Affiche, afficheurBoard: AfficheBoard)

game.jouer()

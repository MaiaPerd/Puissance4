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

//Partie Humain / Humain

var h = Humain(scanner: Scanner) // Humain(nom: "nom", scanner: Scanner)

var game = Game(joueur1: Humain(nom: "Maia" ,scanner: Scanner), joueur2: h, regle: basicRule, afficheur: Affiche, afficheurBoard: AfficheBoard)
//game.jouer()

//Partie Humain / IA

var ia = IA()
var ia2 = IAColonneOrder()
var ia3 = IALigneOrder()

var ia4 = IAColonne(numPlayer: 2) // faire attention a bien l'utilisé en joueur 2
var ia5 = IALigne(numPlayer: 2) // faire attention a bien l'utilisé en joueur 2

var game2 = Game(joueur1: Humain(nom: "Maia" ,scanner: Scanner), joueur2: ia, regle: basicRule, afficheur: Affiche, afficheurBoard: AfficheBoard)
//game2.jouer()

//Partie IA / IA

var ia6 = IAColonne(numPlayer: 1) // faire attention a bien l'utilisé en joueur 1
var ia7 = IALigne(numPlayer: 1) // faire attention a bien l'utilisé en joueur 1

var game3 = Game(joueur1: ia, joueur2: ia, regle: basicRule, afficheur: Affiche, afficheurBoard: AfficheBoard)
game3.jouer()


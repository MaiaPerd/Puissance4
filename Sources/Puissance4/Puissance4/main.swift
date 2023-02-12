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


func choisirJoueur()->Int{
    var res: Int? = nil
    while(res==nil){
        let saisie = readLine(strippingNewline: true)
        if let s = saisie {
            res = Int(s) ?? nil
        }
        if let r = res {
            if r <= 0 || r > 6 {
                print("Saisie incorrect \n")
                res = nil
            }
        }
        if res == nil {
            print("Saisie incorrect, saisir un chiffre \n")
        }
    }
    return res!
}

func selectPlayer(n: Int, numJoueur: Int)->Player{
    if n == 1 {
        print("Choisir le nom du joueur: \n")
        let saisie = readLine(strippingNewline: true)
        if saisie == "" || saisie == nil{
            return Humain(scanner: Scanner)
        } else {
            return Humain(nom: saisie!, scanner: Scanner)
        }
    } else if n == 2 {
        return IA()
    } else if n == 3 {
        return IAColonneOrder()
    } else if n == 4 {
        return IALigneOrder()
    } else if n == 5 {
        return IAColonne(numPlayer: numJoueur)
    } else if n == 6 {
        return IALigne(numPlayer: numJoueur)
    }
    return Player()
}

func afficherJoueur(){
    
    print("1 - Humain \n")
    print("2 - IA (joue aléatoirement) \n")
    print("3 - IA (rempli les colonnes en partant de la gauche) \n")
    print("4 - IA (joue dans les lignes une à une en partant de la gauche) \n")
    print("5 - IAColonne (essaie de gagner avec une colonne en partant de la gauche) \n")
    print("6 - IALigne (essaie de gagner avec une ligne en partant de la gauche) \n")
}

print("Nouvelle partie de Puissance 4 \n")

print("Choisir le joueur 1: \n")

afficherJoueur()
var player1 = selectPlayer(n: choisirJoueur(), numJoueur: 1)

print("Choisir le joueur 2: \n")

afficherJoueur()
var player2 = selectPlayer(n: choisirJoueur(), numJoueur: 2)

// Lancement de la partie
var res = Game(joueur1: player1, joueur2: player2, regle: basicRule, afficheur: Affiche, afficheurBoard: AfficheBoard).jouer()



//---------------------------------------------------------------//

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

var game3 = Game(joueur1: h, joueur2: h, regle: basicRule, afficheur: Affiche, afficheurBoard: AfficheBoard)
//game3.jouer()


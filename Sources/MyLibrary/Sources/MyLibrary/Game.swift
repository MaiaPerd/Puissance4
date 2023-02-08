//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public struct Game{
    
    let afficheur: (String)->Void
    let afficheurBoard: (Board)->Void
    let joueur: [Int: Player]
    var board: Board
    let rule: Rules
    
    public init(joueur1: Player, joueur2: Player, regle: Rules, afficheur: @escaping (String)->Void, afficheurBoard: @escaping (Board)->Void ) {
        self.afficheur = afficheur
        self.afficheurBoard = afficheurBoard
        self.joueur = [1: joueur1, 2: joueur2]
        self.board = regle.createBoard()
        self.rule = regle
    }
    
     public mutating func jouer(){
         afficheurBoard(board)
        while (board.isFull() == false) {
            let idJoueur = rule.getNextPlayer(board: board)
            afficheur("A \(joueur[idJoueur]!.nom) de jouer")
            let res = jouerUnePiece(JoueurId: idJoueur)
            if res != RulesEnum.erreur {
                if res == RulesEnum.enCours {
                    afficheur("\( joueur[idJoueur]!.nom) a jouer, la partie continue \n")
                    afficheurBoard(board)
                } else if res == RulesEnum.egalite {
                    afficheur("egalité")
                    break
                } else if res == RulesEnum.unkown || res == RulesEnum.erreur {
                    afficheur("erreur du programme")
                    break
                } else {
                    afficheurBoard(board)
                    afficheur("partie fini \( joueur[idJoueur]!.nom) à gagner \(res)")
                    break
                }
            } else {
                afficheur("erreur")
            }
        }
    }
    
    private mutating func jouerUnePiece(JoueurId id: Int) -> RulesEnum {
        var choix = joueur[id]!.choisirColonne(LeBoard: board, LaRegle: rule)
        while choix == nil {
            afficheur("Colonne inexistante")
            choix = joueur[id]!.choisirColonne(LeBoard: board, LaRegle: rule)
        }
        let res = board.insertPiece(id: id, colonne: choix!)
        if res == BoardEnum.failed {
            return RulesEnum.erreur
        }
        return rule.gameEnd(board: board, newPiece: choix!)

    }
    
    
}

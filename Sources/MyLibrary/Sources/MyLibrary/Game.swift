//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

///
/// Class Game: Permet de joueur une partie de 2 joueurs de puissance 4
///
public class Game{
    
    private let afficheur: (String)->Void
    private let afficheurBoard: (Board)->Void
    public let joueur: [Int: Player]
    private var board: Board
    private let rule: Rules
    
    public init(joueur1: Player, joueur2: Player, regle: Rules, afficheur: @escaping (String)->Void, afficheurBoard: @escaping (Board)->Void ) {
        self.afficheur = afficheur
        self.afficheurBoard = afficheurBoard
        self.joueur = [1: joueur1, 2: joueur2]
        self.board = regle.createBoard()
        self.rule = regle
    }
    
    ///
    /// Génère une partie
    ///
     public func jouer()-> RulesEnum{
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
                    return res
                } else if res == RulesEnum.unkown || res == RulesEnum.erreur {
                    afficheur("erreur du programme")
                } else {
                    afficheurBoard(board)
                    afficheur("partie fini \( joueur[idJoueur]!.nom) à gagner \(res)")
                    return res
                }
            } else {
                afficheur("erreur")
            }
        }
        return RulesEnum.erreur
    }
    
    private func jouerUnePiece(JoueurId id: Int) -> RulesEnum {
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

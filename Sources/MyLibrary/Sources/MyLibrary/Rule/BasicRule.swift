//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

///
/// Struct BasicRule: regles classique du puissance 4
///
public struct BasicRule : Rules{
    private let joueur1 = 1
    private let joueur2 = 2
    
    static public var nbColonnes: Int { get{ 7 } }
    
    static public var nbLignes: Int { get{ 6 } }
    
    public var nbPieceAlign: Int { get{ 4 } }
    
    public init(){
      
    }
    
    public func createBoard() -> Board {
        return Board(colonnes: BasicRule.nbColonnes, lignes: BasicRule.nbLignes)!
    }
    
    public func isValid(board: Board, newPieceColonne colonne: Int) -> Bool {
        guard colonne < BasicRule.nbColonnes && colonne >= 0 else {
            return false
        }
        return !board.colonneIsFull(numColonne: colonne)
    }
    
    public func getNextPlayer(board: Board) -> Int {
        let j1 = board.nbJoueur(numJoueur: joueur1)
        let j2 = board.nbJoueur(numJoueur: joueur2)
        if j1 == j2 {
            return joueur1
        } else {
            return joueur2
        }
    }
    
    public func gameEnd(board: Board, newPiece position: Int) ->  RulesEnum{
        guard boardIsValide(board: board) else {return RulesEnum.erreur}
        if !(ligneAlign(board: board, position: position) == RulesEnum.unkown) {
            return ligneAlign(board: board, position: position)
        }
        if !(colonneAlign(board: board, position: position) == RulesEnum.unkown) {
            return colonneAlign(board: board, position: position)
        }
        if !(diaganalAlignDroite(board: board, position: position) == RulesEnum.unkown) {
            return diaganalAlignDroite(board: board, position: position)
        }
        if !(diaganalAlignGauche(board: board, position: position) == RulesEnum.unkown) {
            return diaganalAlignGauche(board: board, position: position)
        }
        if board.isFull() {
            return RulesEnum.egalite
        }
        return RulesEnum.enCours
        
    }
    
    private func boardIsValide(board: Board)-> Bool{
        return board.nbColonnes == BasicRule.nbColonnes && board.nbLignes == BasicRule.nbLignes
    }
    
    private func minColonne(_ colonne: Int) -> Int{
        var minColonne = (colonne - (nbPieceAlign-1))
        if minColonne < 0 { minColonne = 0}
        return minColonne
    }
    
    private func maxColonne(_ colonne: Int) -> Int{
        var maxColonne = (colonne + (nbPieceAlign-1))
        if maxColonne > BasicRule.nbColonnes-1 { maxColonne = BasicRule.nbColonnes-1}
        return maxColonne
    }
    
 public func ligneAlign(board: Board, position colonne: Int) -> RulesEnum {
     var joueursCountLigne = [0,0]
     for l in board.grid{
         joueursCountLigne = [0,0]
         for i in minColonne(colonne)...maxColonne(colonne) {
             if l[i] == joueur1 {
                joueursCountLigne[0] += 1
                 if joueursCountLigne[0] == nbPieceAlign {
                     return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.ligne, positionStart: [(board.grid.firstIndex(of: l) ?? 0), i-(nbPieceAlign-1)]) }
                    joueursCountLigne[1] = 0
                }
            if l[i] == joueur2 {
                joueursCountLigne[1] += 1
                if joueursCountLigne[1] == nbPieceAlign {
                    return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.ligne, positionStart: [(board.grid.firstIndex(of: l) ?? 0), i-(nbPieceAlign-1)]) }
                    joueursCountLigne[0] = 0
                }
            if l[i] == nil{
                joueursCountLigne[0] = 0
                joueursCountLigne[1] = 0
            }
        }
        
        }
        return RulesEnum.unkown
    }
    
    private func colonneAlign(board: Board, position colonne: Int) -> RulesEnum {
        var joueurs1CountColonne = Array(repeating: 0, count: BasicRule.nbColonnes)
        var joueurs2CountColonne = Array(repeating: 0, count: BasicRule.nbColonnes)
        var ligne = 0
        for l in board.grid{
                if l[colonne] == joueur1 {
                    joueurs1CountColonne[colonne] += 1
                    if joueurs1CountColonne[colonne] == nbPieceAlign{
                        return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.colonne, positionStart: [ligne-(nbPieceAlign-1), colonne])
                    }
                    joueurs2CountColonne[colonne] = 0
                }
                if l[colonne] == joueur2 {
                    joueurs2CountColonne[colonne] += 1
                    if joueurs2CountColonne[colonne] == nbPieceAlign{
                        return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.colonne, positionStart: [ligne-(nbPieceAlign-1), colonne])
                    }
                    joueurs1CountColonne[colonne] = 0
                }
                if l[colonne] == nil{
                    joueurs1CountColonne[colonne] = 0
                    joueurs2CountColonne[colonne] = 0
                }
            ligne += 1
        }
        return RulesEnum.unkown
    }
    
    private func diaganalAlignDroite(board: Board, position numColonne: Int) -> RulesEnum {
        var joueurs1CountColonne = 0
        var joueurs2CountColonne = 0
        let grid = board.grid
        for ligne in 0..<BasicRule.nbLignes-(nbPieceAlign){
            for i in minColonne(numColonne)...(maxColonne(numColonne)-(nbPieceAlign-1)) {
                joueurs1CountColonne = 0
                joueurs2CountColonne = 0
                for nombre in 0..<nbPieceAlign{
                    if grid[ligne+nombre][i+nombre] == joueur1 {
                        joueurs1CountColonne = joueurs1CountColonne + 1
                        joueurs2CountColonne = 0
                    } else if grid[ligne+nombre][i+nombre] == joueur2 {
                        joueurs2CountColonne = joueurs2CountColonne + 1
                        joueurs1CountColonne = 0
                    } else {
                        joueurs1CountColonne = 0
                        joueurs2CountColonne = 0
                    }
                    
                    if joueurs1CountColonne == nbPieceAlign { return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.diagonalDroite, positionStart: [ligne,i])}
                    else if joueurs2CountColonne == nbPieceAlign  { return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.diagonalDroite, positionStart: [ligne,i])}
                }
                
            }
            
        }
        /*/
        var joueurs1CountColonneDroite = Array(repeating: 0, count: nbColonnes)
        var joueurs2CountColonneDroite = Array(repeating: 0, count: nbColonnes)
        var diagonal = 0
        for l in board.grid{
            for i in diagonal..<(nbColonnes){
                if l[i] == 1 {
                    joueurs1CountColonneDroite[i-diagonal] += 1
                    if joueurs1CountColonneDroite[i-diagonal] == nbPieceAlign { return RulesEnum.joueur(1, Combinaison.diagonalDroite) }
                    joueurs2CountColonneDroite[i-diagonal] = 0
                }
                if l[i] == 2 {
                    joueurs2CountColonneDroite[i-diagonal] += 1
                    if joueurs2CountColonneDroite[i-diagonal] == nbPieceAlign { return RulesEnum.joueur(2, Combinaison.diagonalDroite) }
                    joueurs1CountColonneDroite[i-diagonal] = 0
                }
            }
            diagonal += 1
        }*/

        return RulesEnum.unkown
    }
    
    private func diaganalAlignGauche(board: Board, position numColonne: Int) -> RulesEnum {
        var joueurs1CountColonne = 0
        var joueurs2CountColonne = 0
        let grid = board.grid
        for ligne in (0..<BasicRule.nbLignes-nbPieceAlign){
            for i in ((minColonne(numColonne)+(nbPieceAlign-1))...maxColonne(numColonne)).reversed() {
                joueurs1CountColonne = 0
                joueurs2CountColonne = 0
                for nombre in 0..<nbPieceAlign{
                    if grid[ligne+nombre][i-nombre] == joueur1 {
                        joueurs1CountColonne = joueurs1CountColonne + 1
                        joueurs2CountColonne = 0
                    } else if grid[ligne+nombre][i-nombre] == joueur2 {
                        joueurs2CountColonne = joueurs2CountColonne + 1
                        joueurs1CountColonne = 0
                    } else {
                        joueurs1CountColonne = 0
                        joueurs2CountColonne = 0
                    }
                }
                if joueurs1CountColonne == nbPieceAlign { return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.diagonalGauche, positionStart: [ligne,i])}
                else if joueurs2CountColonne == nbPieceAlign  { return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.diagonalGauche, positionStart: [ligne,i])}
                
            }
            
        }
        /*
        var joueurs1CountColonneGauche = Array(repeating: 0, count: nbColonnes)
        var joueurs2CountColonneGauche = Array(repeating: 0, count: nbColonnes)
        var diagonal = 0
        while(diagonal < nbColonnes){
            for i in (0..<(nbLignes-diagonal)).reversed(){
                if board.grid[i+diagonal][i] == 1 {
                    joueurs1CountColonneGauche[diagonal] += 1
                    if joueurs1CountColonneGauche[diagonal] == nbPieceAlign { return RulesEnum.joueur(1, Combinaison.diagonalGauche) }
                    joueurs2CountColonneGauche[diagonal] = 0
                }
                if board.grid[i+diagonal][i] == 2 {
                    joueurs2CountColonneGauche[diagonal] += 1
                    if joueurs2CountColonneGauche[diagonal] == nbPieceAlign { return RulesEnum.joueur(2, Combinaison.diagonalGauche) }
                    joueurs1CountColonneGauche[diagonal] = 0
                }
            }
            diagonal += 1
        }
      */
        return RulesEnum.unkown
    }
    
    
    
    
    
}

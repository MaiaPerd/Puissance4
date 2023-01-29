//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public struct BasicRule : Rules{
    private let joueur1 = 1
    private let joueur2 = 2
    
    public func gameEnd(board: Board) -> RulesEnum {
        guard boardIsValide(board: board) else {return RulesEnum.erreur}
        var res = Array<RulesEnum>()
        res.append(ligneAlign(board: board))
        res.append(colonneAlign(board: board))
        res.append(diaganalAlignDroite(board: board))
        res.append(diaganalAlignGauche(board: board))
        if board.isFull() {
            return RulesEnum.egalite
        }
        return RulesEnum.enCours
    }
    
    public init(){
      
    }
    
    public var nbColonnes: Int { get{ 7 } }
    
    public var nbLignes: Int { get{ 6 } }
    
    public var nbPieceAlign: Int { get{ 4 } }
    
    public func gameEndTest(board: Board) -> [RulesEnum] {
        guard boardIsValide(board: board) else {return [RulesEnum.erreur]}
        var res = Array<RulesEnum>()
        res.append(ligneAlign(board: board))
        res.append(colonneAlign(board: board))
        res.append(diaganalAlignDroite(board: board))
        res.append(diaganalAlignGauche(board: board))
        if board.isFull() {
            res.append(RulesEnum.egalite)
        }
       res.append(RulesEnum.enCours)
        return res
    }
    
    func boardIsValide(board: Board)-> Bool{
        return board.nbColonnes == nbColonnes && board.nbLignes == nbLignes
    }
    
    func ligneAlign(board: Board) -> RulesEnum {
        var joueursCountLigne = [0,0]
        for l in board.grid{
            joueursCountLigne = [0,0]
            for c in l {
                if c == joueur1 {
                    joueursCountLigne[0] += 1
                    if joueursCountLigne[0] == nbPieceAlign { return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.ligne, positionStart: [ 0]) }
                    joueursCountLigne[1] = 0
                }
                if c == joueur2 {
                    joueursCountLigne[0] = 0
                    if joueursCountLigne[0] == nbPieceAlign { return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.ligne, positionStart: [0]) }
                    joueursCountLigne[1] += 1
                }
            }
        }
        return RulesEnum.unkown
    }
    
    func colonneAlign(board: Board) -> RulesEnum {
        var joueurs1CountColonne = Array(repeating: 0, count: nbColonnes)
        var joueurs2CountColonne = Array(repeating: 0, count: nbColonnes)
        for l in board.grid{
            for i in 0..<nbColonnes{
                if l[i] == joueur1 {
                    joueurs1CountColonne[i] += 1
                    if joueurs1CountColonne[i] == nbPieceAlign{
                        return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.ligne, positionStart: [i])
                    }
                    joueurs2CountColonne[i] = 0
                }
                if l[i] == joueur2 {
                    joueurs2CountColonne[i] += 2
                    if joueurs2CountColonne[i] == nbPieceAlign{
                        return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.ligne, positionStart: [i])
                    }
                    joueurs1CountColonne[i] = 0
                }
            }
        }
        return RulesEnum.unkown
    }
    
    func diaganalAlignDroite(board: Board) -> RulesEnum {
        var joueurs1CountColonne = 0
        var joueurs2CountColonne = 0
        let grid = board.grid
        for ligne in 0..<nbLignes-(nbPieceAlign){
            for colonne in 0..<nbColonnes-(nbPieceAlign){
                joueurs1CountColonne = 0
                joueurs2CountColonne = 0
                for nombre in 0..<nbPieceAlign{
                    if grid[ligne+nombre][colonne+nombre] == joueur1 {
                        joueurs1CountColonne = joueurs1CountColonne + 1
                        joueurs2CountColonne = 0
                    } else if grid[ligne+nombre][colonne+nombre] == joueur2 {
                        joueurs2CountColonne = joueurs2CountColonne + 1
                        joueurs1CountColonne = 0
                    } else {
                        joueurs1CountColonne = 0
                        joueurs2CountColonne = 0
                    }
                }
                if joueurs1CountColonne == nbPieceAlign { return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.diagonalDroite, positionStart: [ligne,colonne])}
                else if joueurs2CountColonne == nbPieceAlign  { return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.diagonalDroite, positionStart: [ligne,colonne])}
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
    
    func diaganalAlignGauche(board: Board) -> RulesEnum {
        var joueurs1CountColonne = 0
        var joueurs2CountColonne = 0
        let grid = board.grid
        for ligne in (0..<nbLignes-nbPieceAlign){
            for colonne in (nbPieceAlign..<nbColonnes).reversed(){
                joueurs1CountColonne = 0
                joueurs2CountColonne = 0
                for nombre in 0..<nbPieceAlign{
                    if grid[ligne+nombre][colonne-nombre] == joueur1 {
                        joueurs1CountColonne = joueurs1CountColonne + 1
                        joueurs2CountColonne = 0
                    } else if grid[ligne+nombre][colonne-nombre] == joueur2 {
                        joueurs2CountColonne = joueurs2CountColonne + 1
                        joueurs1CountColonne = 0
                    } else {
                        joueurs1CountColonne = 0
                        joueurs2CountColonne = 0
                    }
                }
                if joueurs1CountColonne == nbPieceAlign { return RulesEnum.joueur(joueur: joueur1, combinaison: Combinaison.diagonalGauche, positionStart: [ligne,colonne])}
                else if joueurs2CountColonne == nbPieceAlign  { return RulesEnum.joueur(joueur: joueur2, combinaison: Combinaison.diagonalGauche, positionStart: [ligne,colonne])}
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

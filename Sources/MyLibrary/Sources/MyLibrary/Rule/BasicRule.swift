//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 24/01/2023.
//

import Foundation

public struct BasicRule : Rules{
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
                if c == 1 {
                    joueursCountLigne[0] += 1
                    if joueursCountLigne[0] == nbPieceAlign { return RulesEnum.joueur(1, Combinaison.ligne) }
                    joueursCountLigne[1] = 0
                }
                if c == 2 {
                    joueursCountLigne[0] = 0
                    if joueursCountLigne[0] == nbPieceAlign { return RulesEnum.joueur(2, Combinaison.ligne) }
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
                if l[i] == 1 {
                    joueurs1CountColonne[i] += 1
                    if joueurs1CountColonne[i] == nbPieceAlign{
                        return RulesEnum.joueur(1, Combinaison.colonne)
                    }
                    joueurs2CountColonne[i] = 0
                }
                if l[i] == 2 {
                    joueurs2CountColonne[i] += 2
                    if joueurs2CountColonne[i] == nbPieceAlign{
                        return RulesEnum.joueur(2, Combinaison.colonne)
                    }
                    joueurs1CountColonne[i] = 0
                }
            }
        }
        return RulesEnum.unkown
    }
    
    func diaganalAlignDroite(board: Board) -> RulesEnum {
        var joueurs1CountColonneDroite = Array(repeating: 0, count: nbColonnes)
        var joueurs2CountColonneDroite = Array(repeating: 0, count: nbColonnes)
        var diagonal = 0
        while(diagonal < nbColonnes){
            for i in 0..<(nbLignes-diagonal){
                if board.grid[i+diagonal][i] == 1 {
                    joueurs1CountColonneDroite[diagonal] += 1
                    if joueurs1CountColonneDroite[diagonal] == nbPieceAlign { return RulesEnum.joueur(1, Combinaison.diagonalDroite) }
                    joueurs2CountColonneDroite[diagonal] = 0
                }
                if board.grid[i+diagonal][i] == 2 {
                    joueurs2CountColonneDroite[diagonal] += 1
                    if joueurs2CountColonneDroite[diagonal] == nbPieceAlign { return RulesEnum.joueur(2, Combinaison.diagonalDroite) }
                    joueurs1CountColonneDroite[diagonal] = 0
                }
            }
            diagonal += 1
        }
      
        return RulesEnum.unkown
    }
    
    func diaganalAlignGauche(board: Board) -> RulesEnum {
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
      
        return RulesEnum.unkown
    }
    
    
}

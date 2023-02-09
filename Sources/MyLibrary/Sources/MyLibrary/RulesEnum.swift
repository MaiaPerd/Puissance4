//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 25/01/2023.
//

import Foundation

///
/// Enum RulesEnum: Les différents cas de réusite d'une partie
///
public enum RulesEnum : Equatable{
    case unkown
    case egalite
    case joueur(joueur: Int, combinaison: Combinaison, positionStart: [Int]?)
    case enCours
    case erreur
   
}

///
/// Enum Combinaison: Les différentes combinaison posible pour gagner
///
public enum Combinaison{
    case unkown
    case ligne
    case colonne
    case diagonalDroite
    case diagonalGauche
}

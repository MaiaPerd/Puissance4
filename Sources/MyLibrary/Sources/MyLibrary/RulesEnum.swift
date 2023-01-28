//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 25/01/2023.
//

import Foundation

public enum RulesEnum {
    case unkown
    case egalite
    case joueur(Int, Combinaison)
    case enCours
    case erreur
}

public enum Combinaison{
    case unkown
    case ligne
    case colonne
    case diagonalDroite
    case diagonalGauche
}

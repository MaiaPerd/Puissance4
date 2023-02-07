//
//  File.swift
//  
//
//  Created by Perderizet Maïa on 31/01/2023.
//

import Foundation

public class Saisisseur {
    
    public static func saisirUneColonne()-> Int{
        var saisie = readLine(strippingNewline: true)
        if let s = saisie {
            return Int(s) ?? -1
        }
        return -1
    }
    
}

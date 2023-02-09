//Stub
import XCTest
@testable import MyLibrary

final class GameTests: XCTestCase {
    
    func Affiche(Afficher chaine: String){
    }
    
    func AfficheBoard(LeBoard board: Board){
    }
    
    func testUnitJoueur() throws {
        func expect(game: Game, res: RulesEnum){
            XCTAssertEqual(game.jouer(), res)
        }
        expect(game: Game(joueur1: IALigneOrder(nom: "1"), joueur2: IALigneOrder(nom: "2"), regle: BasicRule(), afficheur: Affiche, afficheurBoard: AfficheBoard), res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.ligne, positionStart: [0,0]))
        expect(game: Game(joueur1: IAColonneOrder(nom: "1"), joueur2: IAColonneOrder(nom: "2"), regle: BasicRule(), afficheur: Affiche, afficheurBoard: AfficheBoard), res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.ligne, positionStart: [0,0]))
        expect(game: Game(joueur1: IALigne(numPlayer: 1), joueur2: IALigne(numPlayer: 2), regle: BasicRule(), afficheur: Affiche, afficheurBoard: AfficheBoard), res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.colonne, positionStart: [0,0]))
        expect(game: Game(joueur1: IAColonne(numPlayer: 1), joueur2: IAColonne(numPlayer: 2), regle: BasicRule(), afficheur: Affiche, afficheurBoard: AfficheBoard), res: RulesEnum.joueur(joueur: 2, combinaison: MyLibrary.Combinaison.diagonalGauche, positionStart: [0, 3]))
    }
    
}

import XCTest
@testable import MyLibrary

final class BasicRuleTests: XCTestCase {

    func testUnitConstructorBoard() throws {
        let basicRule = BasicRule()
        XCTAssertEqual(basicRule.nbPieceAlign, 4)
        XCTAssertEqual(basicRule.nbLignes, 6)
        XCTAssertEqual(basicRule.nbColonnes, 7)
    }
    
    func testUnitGameEnd() throws {
        func expect(initBoard board: Board, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board)
            XCTAssertEqual(result, res)
        }
        
        expect(initBoard: Board(colonnes: 2, lignes: 5)!, res: RulesEnum.erreur)
        expect(initBoard: Board(colonnes: 10, lignes: 7)!, res: RulesEnum.erreur)
        expect(initBoard: Board(colonnes: 7, lignes: 6)!, res: RulesEnum.enCours)
        expect(initBoard: Board(grid: [[nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
                                       res: RulesEnum.enCours)
        expect(initBoard: Board(grid: [[1,2,1,1,2,2,1],
                                       [1,1,2,2,1,2,1],
                                       [1,2,2,1,1,2,1],
                                       [2,1,1,2,2,1,2],
                                       [1,2,2,1,1,2,1],
                                       [2,1,2,1,2,1,2]])!,
                                       res: RulesEnum.egalite)
        
    }
    
    func testUnitGameEndLine() throws {
        func expect(initBoard board: Board, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board)
            XCTAssertEqual(result, res)
        }

        expect(initBoard: Board(grid: [[2,1,1,1,1,1,2],
                                       [1,2,2,1,1,2,1],
                                       [nil,1,1,2,2,2,2],
                                       [nil,2,2,1,nil,2,1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.ligne, positionStart: nil))
        expect(initBoard: Board(grid: [[  2,  1,  2,  1,  1,  1,  2],
                                       [  1,  2,  2,  1,  1,  2,  1],
                                       [nil,  1,  1,  2,  2,  2,  2],
                                       [nil,  2,  2,  1,nil,  2,  1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.ligne, positionStart: nil))
    }
    
    func testUnitGameEndColonne() throws {
        func expect(initBoard board: Board, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board)
            XCTAssertEqual(result, res)
        }
        
        
        expect(initBoard: Board(grid: [[  2,  1,  2,  1,  1,  1,  2],
                                       [  1,  2,  2,  1,  1,  2,  1],
                                       [nil,  2,  2,  1,  2,  2,  2],
                                       [nil,  2,  2,  1,  2,  2,  2],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.colonne, positionStart: [2]))//ligne
        expect(initBoard: Board(grid: [[2,1,2,1,1,1,2],
                                       [1,1,2,1,1,2,1],
                                       [nil,1,1,2,2,1,2],
                                       [nil,1,2,1,nil,2,1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.colonne, positionStart: [1]))//ligne
        
    }
    
    func testUnitGameEndDiagonal() throws {
        func expect(initBoard board: Board, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board)
            XCTAssertEqual(result, res)
        }
        
        expect(initBoard: Board(grid: [[  2,  1,  2,  2,  1,  1,  2],
                                       [  1,  2,  1,  1,  1,  2,  1],
                                       [nil,  1,  1,  1,  2,  2,  2],
                                       [nil,  1,  2,  1,  1,  2,  1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.diagonalDroite, positionStart: [0,1]))
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  1,  2],
                                       [  1,  2,  1,  1,  1,  2,  1],
                                       [nil,  1,  2,  1,  2,  2,  2],
                                       [nil,  1,  2,  2,  1,  2,  1],
                                       [nil,nil,nil,nil,2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.diagonalDroite, positionStart: [1,1]))
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  1,  2],
                                       [  1,  2,  1,  2,  1,  2,  1],
                                       [nil,  1,  1,  1,  2,  2,  2],
                                       [nil,  1,  2,  2,  1,  1,  1],
                                       [nil,nil,nil,nil,2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.diagonalGauche, positionStart: [0,6]))//encourd
        expect(initBoard: Board(grid: [[1,2,2,1,1,2,2],
                                       [1,2,1,2,2,1,1],
                                       [nil,1,2,1,1,2,2],
                                       [nil,1,2,1,1,2,1],
                                       [nil,nil,1,nil,2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.diagonalGauche, positionStart: [1,5]))//Droite
    }
    
    
}

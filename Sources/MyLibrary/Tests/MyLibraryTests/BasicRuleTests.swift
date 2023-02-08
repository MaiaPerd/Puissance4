import XCTest
@testable import MyLibrary

final class BasicRuleTests: XCTestCase {

    func testUnitConstructorRule() throws {
        XCTAssertEqual(BasicRule.nbPieceAlign, 4)
        XCTAssertEqual(BasicRule.nbLignes, 6)
        XCTAssertEqual(BasicRule.nbColonnes, 7)
    }
    
    func testUnitGameEnd() throws {
        func expect(initBoard board: Board, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board, newPiece: 0)
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
                                       [nil,1,2,1,2,1,2]])!,
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
        func expect(initBoard board: Board, position: Int, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board, newPiece: position)
            XCTAssertEqual(result, res)
        }

        expect(initBoard: Board(grid: [[2,1,1,1,1,1,2],
                                       [1,nil,2,1,1,2,1],
                                       [nil,1,1,2,2,2,2],
                                       [nil,2,2,1,nil,2,1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 1,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.ligne, positionStart: [0,1]))
        expect(initBoard: Board(grid: [[  2,  1,  2,  1,  1,  1,  2],
                                       [  1,  2,  2,  1,  1,  2,  1],
                                       [nil,  1,  1,  2,  2,  2,  2],
                                       [nil,  2,  2,  1,nil,  2,  1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 4,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.ligne, positionStart: [2,3]))
    }
    
    func testUnitGameEndColonne() throws {
        func expect(initBoard board: Board, position: Int, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board, newPiece: position)
            XCTAssertEqual(result, res)
        }
        
        
        expect(initBoard: Board(grid: [[  2,  1,  2,  1,  1,  1,  2],
                                       [  1,  2,  2,  1,  1,  2,  1],
                                       [nil,  2,  2,  1,  2,  2,  2],
                                       [nil,  1,  2,  1,  2,  2,  2],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 2,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.colonne, positionStart: [0,2]))
        expect(initBoard: Board(grid: [[2,1,2,1,1,1,2],
                                       [1,1,2,1,1,2,1],
                                       [nil,1,1,2,2,1,2],
                                       [nil,1,2,1,nil,2,1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 1,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.colonne, positionStart: [0,1]))
        
    }
    
    func testUnitGameEndDiagonal() throws {
        func expect(initBoard board: Board, position: Int, res: RulesEnum){
            let basicRule = BasicRule()
            let result = basicRule.gameEnd(board: board, newPiece: position)
            XCTAssertEqual(result, res)
        }
        
        expect(initBoard: Board(grid: [[  2,  1,  2,  2,  1,  1,  2],
                                       [  1,nil,  1,  1,  1,  2,  1],
                                       [nil,nil,  1,  1,  2,  2,  2],
                                       [nil,nil,  2,  1,  1,  2,  1],
                                       [nil,nil,nil,nil,nil,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 1,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.diagonalDroite, positionStart: [0,1]))
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  1,  2],
                                       [  1,  2,  1,  1,  1,  2,  1],
                                       [nil,nil,  2,  1,  2,  2,  2],
                                       [nil,nil,  2,  2,  1,  2,  1],
                                       [nil,nil,nil,nil,2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 1,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.diagonalDroite, positionStart: [1,1]))
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  1,  2],
                                       [  1,  2,  1,  2,  1,  2,nil],
                                       [nil,  1,  1,  1,  2,  2,nil],
                                       [nil,  1,  2,  2,  1,  1,nil],
                                       [nil,nil,nil,nil,  2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 6,
               res: RulesEnum.joueur(joueur: 2, combinaison: Combinaison.diagonalGauche, positionStart: [0,6]))
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  2,  2],
                                       [  1,  2,  1,  2,  2,  1,  1],
                                       [nil,  1,  2,  1,  1,nil,  2],
                                       [nil,  1,  2,  1,  1,nil,  1],
                                       [nil,nil,  1,nil,  2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!,position: 5,
               res: RulesEnum.joueur(joueur: 1, combinaison: Combinaison.diagonalGauche, positionStart: [1,5]))
    }
    
    func testUnitCreateBoard() throws {
        var board = BasicRule().createBoard()
        XCTAssertEqual(board.nbColonnes, BasicRule.nbColonnes)
        XCTAssertEqual(board.nbLignes, BasicRule.nbLignes)
    }
    
    func testUnitGetNextJoueur() throws {
        func expect(initBoard board: Board, res: Int){
            XCTAssertEqual(res, BasicRule().getNextPlayer(board: board))
        }
        
        expect(initBoard: Board(grid: [[nil,nil,nil,nil,nil,nil,nil],
                                        [nil,nil,nil,nil,nil,nil,nil],
                                        [nil,nil,nil,nil,nil,nil,nil],
                                        [nil,nil,nil,nil,nil,nil,nil],
                                        [nil,nil,nil,nil,nil,nil,nil],
                                        [nil,nil,nil,nil,nil,nil,nil]])!, res: 1)
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  1,  2],
                                       [  1,  2,  1,  2,  1,  2,nil],
                                       [nil,  1,  1,  1,  2,  2,nil],
                                       [nil,nil,  2,  2,  1,  1,nil],
                                       [nil,nil,nil,nil,  2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!, res: 2)
        expect(initBoard: Board(grid: [[  1,  2,  2,  1,  1,  1,  2],
                                       [  1,  2,  1,  2,  1,  2,nil],
                                       [nil,nil,  1,  1,  2,  2,nil],
                                       [nil,nil,  2,  2,  1,  1,nil],
                                       [nil,nil,nil,nil,  2,nil,nil],
                                       [nil,nil,nil,nil,nil,nil,nil]])!, res: 1)
    }
}

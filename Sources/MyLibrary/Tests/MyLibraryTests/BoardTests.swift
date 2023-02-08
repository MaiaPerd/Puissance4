import XCTest
@testable import MyLibrary

final class BoardTests: XCTestCase {

    func testUnitBasicConstructorBoard() throws {
        func expect(initLigne nbLignes: Int, etColonne nbColonnes: Int, res: Bool){
            let board = Board(colonnes: nbColonnes, lignes: nbLignes)
            if !res{
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(nbColonnes, board?.nbColonnes)
            XCTAssertEqual(nbLignes, board?.nbLignes)
        }
        
        expect(initLigne: 1, etColonne: 1, res: true)
        expect(initLigne: -1, etColonne: 10, res: false)
        expect(initLigne: 1, etColonne: -1, res: false)
        expect(initLigne: -2, etColonne: -2, res: false)
        expect(initLigne: 0, etColonne: 0, res: false)
        expect(initLigne: 0, etColonne: 3, res: false)
        expect(initLigne: 3, etColonne: 0, res: false)
        expect(initLigne: 3, etColonne: 5, res: true)
        expect(initLigne: 5, etColonne: 3, res: true)
    }
    
    func testUnitGridConstructorBoard() throws {
        func expect(initGrid grid: [[Int?]], res: Bool){
            let board = Board(grid: grid)
            if !res{
                XCTAssertNil(board)
                return
            }
            XCTAssertNotNil(board)
            XCTAssertEqual(grid.count, board?.nbLignes)
            XCTAssertEqual(grid[0].count, board?.nbColonnes)
        }
        
        expect(initGrid: [[1,1,2],[1,2,nil],[nil,nil,nil]], res: true)
        expect(initGrid: [[1,2,nil],[nil,nil,nil]], res: true)
        expect(initGrid: [[nil,1],[nil,2,nil]], res: false)
        expect(initGrid: [], res: false)
        expect(initGrid: [[]], res: false)
        expect(initGrid: [[],[]], res: false)
        expect(initGrid: [[nil,nil,nil],[nil,nil,nil]], res: true)
        expect(initGrid: [[1,1,2],[1,2,2],[1,1,1]], res: true)
    }
    
    func testUnitInsertPiece() throws {
        let board = Board(colonnes: 7, lignes: 6)
        func expect(initBorad board: Board?, id: Int, colonne: Int, res: Bool){
            if(board == nil){
                return
            }
            var board = board
            
            if !res{
                XCTAssertEqual(BoardEnum.failed, board?.insertPiece(id: id, colonne: colonne))
            } else {
                XCTAssertEqual(BoardEnum.ok, board?.insertPiece(id: id, colonne: colonne))
            }
        }
        
        expect(initBorad: board, id: 1, colonne: 3, res: true)
        expect(initBorad: board, id: 2, colonne: 8, res: false)
        expect(initBorad: board, id: 1, colonne: 2, res: true)
        expect(initBorad: board, id: 1, colonne: -1, res: false)
        expect(initBorad: board, id: 1, colonne: 0, res: true)
    }
    
    func testUnitIsFull() throws {
        func expect(initBoard board: Board, res: Bool){
            XCTAssertEqual(res, board.isFull())
        }
        
        expect(initBoard: Board(colonnes: 7, lignes: 6)!, res: false)
        expect(initBoard: Board(grid: [[1,1,2],[1,2,2],[1,1,1]])!, res: true)
        expect(initBoard: Board(grid: [[nil,1,2],[1,2,2],[1,1,1]])!, res: false)
        expect(initBoard: Board(grid: [[nil,nil,nil],[nil,nil,nil]])!, res: false)
        expect(initBoard: Board(grid: [[1,1,2],[nil,nil,nil],[1,1,1]])!, res: false)
    }
    
    func testUnitColonneIsFull() throws {
        func expect(initBoard board: Board, numColonne: Int, res: Bool){
            XCTAssertEqual(res, board.colonneIsFull(numColonne: numColonne))
        }
        
        expect(initBoard: Board(colonnes: 7, lignes: 6)!, numColonne: 0, res: false)
        expect(initBoard: Board(grid: [[1,1,2],[1,2,2],[1,1,1]])!, numColonne: 1, res: true)
        expect(initBoard: Board(grid: [[1,1,2],[1,2,2],[nil,1,1]])!, numColonne: 0, res: false)
        expect(initBoard: Board(grid: [[nil,nil,nil],[nil,nil,nil]])!, numColonne: 2, res: false)
        expect(initBoard: Board(grid: [[1,1,2],[nil,nil,nil],[1,1,1]])!, numColonne: 2, res: true)
    }
    
    func testUnitSubScript() throws {
        func expect(initBoard board: Board, ligne: Int, colonne: Int, res: Int?){
            
            XCTAssertEqual(res, board.subSript(ligne: ligne, colonne: colonne))
        }
        
        expect(initBoard: Board(colonnes: 7, lignes: 6)!, ligne: 1, colonne: 0, res: nil)
        expect(initBoard: Board(grid: [[1,1,2],[1,2,2],[1,1,1]])!, ligne: 1, colonne: 0, res: 1)
        expect(initBoard: Board(grid: [[nil,1,2],[1,2,2],[1,1,1]])!, ligne: 0, colonne: 0, res: nil)
        expect(initBoard: Board(grid: [[nil,nil,nil],[nil,nil,nil]])!, ligne: 1, colonne: 0, res: nil)
        expect(initBoard: Board(grid: [[1,1,2],[nil,nil,nil],[1,1,1]])!, ligne: 0, colonne: 2, res: 2)
    }
    
    func testUnitNbJoueur() throws {
        func expect(initBoard board: Board, numJoueur: Int, res: Int){
            XCTAssertEqual(res, board.nbJoueur(numJoueur: numJoueur))
        }
        
        expect(initBoard: Board(colonnes: 7, lignes: 6)!, numJoueur: 1, res: 0)
        expect(initBoard: Board(grid: [[1,1,2],[1,2,2],[1,1,1]])!, numJoueur: 2, res: 3)
        expect(initBoard: Board(grid: [[nil,1,2],[1,2,2],[1,1,1]])!, numJoueur: 1, res: 5)
        expect(initBoard: Board(grid: [[nil,nil,nil],[nil,nil,nil]])!, numJoueur: 2, res: 0)
        expect(initBoard: Board(grid: [[1,1,2],[nil,nil,nil],[1,1,1]])!, numJoueur: 2, res: 1)
    }
}

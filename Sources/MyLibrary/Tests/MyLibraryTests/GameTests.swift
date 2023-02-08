//Stub
import XCTest
@testable import MyLibrary

final class GameTests: XCTestCase {
    
    func testUnitConstructorGame() throws {
        XCTAssertEqual(Player().nom, "Player")
        func expect(nom: String, res: String){
            XCTAssertEqual(Player(nom: nom).nom, res)
        }
        expect(nom: "Joueur1", res: "Joueur1")
    }
    
}

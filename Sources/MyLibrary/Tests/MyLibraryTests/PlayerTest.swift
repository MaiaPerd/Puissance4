import XCTest
@testable import MyLibrary

final class PlayerTests: XCTestCase {

    func testUnitConstructorPlayer() throws {
        XCTAssertEqual(Player().nom, "Player")
        func expect(nom: String, res: String){
            XCTAssertEqual(Player(nom: nom).nom, res)
        }
        expect(nom: "Joueur1", res: "Joueur1")
        expect(nom: "Ha", res: "Ha")
        expect(nom: "zadvdosvjihoqsc_Dcnkndjkz", res: "zadvdosvjihoqsc_Dcnkndjkz")
    }
    
    func testUnitChoisirColonne() throws {
        XCTAssertEqual(Player().choisirColonne(LeBoard: BasicRule().createBoard(), LaRegle: BasicRule()), nil)
    }
    
    func Scanner()->Int{
        return 1
    }
    
    func testUnitConstructorHumain() throws {
        XCTAssertEqual(Humain(scanner: Scanner).nom, "Humain")
        func expect(nom: String, res: String){
            XCTAssertEqual(Humain(nom: nom, scanner: Scanner).nom, res)
        }
        expect(nom: "Joueur", res: "Joueur")
        expect(nom: "zadvdosvjihoqsc_Dcnkndjkz", res: "zadvdosvjihoqsc_Dcnkndjkz")
    }
    
    func testUnitJouerHumain() throws {
        XCTAssertEqual(Humain(scanner: Scanner).choisirColonne(LeBoard: Board(colonnes: 6, lignes: 7)!, LaRegle: BasicRule()), 1)
    }
    
    
    func testUnitConstructorIA() throws {
        XCTAssertEqual(IA().nom, "IA")
        func expect(nom: String, res: String){
            XCTAssertEqual(IA(nom: nom).nom, res)
        }
        expect(nom: "IA1", res: "IA1")
        expect(nom: "zadvdosvjihoqsc_Dcnkndjkz", res: "zadvdosvjihoqsc_Dcnkndjkz")
    }
    
    
}

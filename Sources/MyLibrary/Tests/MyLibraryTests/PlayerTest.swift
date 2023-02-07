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
    
    func Scanner()->Int{
        print("Saisir le numéro de la colonne \n")
        var res: Int? = nil
        while(res==nil){
            var saisie = readLine(strippingNewline: true)
            if let s = saisie {
                res = Int(s) ?? nil
            }
        }
        return res! - 1
    }
    
    func testUnitConstructorHumain() throws {
        XCTAssertEqual(Humain(scanner: Scanner).nom, "Humain")
        func expect(nom: String, res: String){
            XCTAssertEqual(Humain(nom: nom, scanner: Scanner).nom, res)
        }
        expect(nom: "Joueur", res: "Joueur")
        expect(nom: "zadvdosvjihoqsc_Dcnkndjkz", res: "zadvdosvjihoqsc_Dcnkndjkz")
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

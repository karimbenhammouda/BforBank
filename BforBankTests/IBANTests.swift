//
//  IBANTests.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/25/24.
//

import XCTest
import BforBank

class IBANTests: XCTestCase {

    func testValidIBAN() {
        // Exemple d'IBAN valide
        let validIBAN = "FR7630006000011234567890189".isValidIBAN()
        // Vérifie que l'IBAN est valide
        XCTAssertTrue(validIBAN)
    }
}

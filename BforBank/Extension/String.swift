//
//  String.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/25/24.
//

import Foundation

public extension String {
    func isValidIBAN() -> Bool {
        let regex = "^[A-Z]{2}[0-9]{2}[A-Z0-9]{1,30}$"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        return predicate.evaluate(with: self)
    }
}


//
//  UnderlineTextFieldViewModel.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/25/24.
//

import SwiftUI

class UnderlineTextFieldViewModel: ObservableObject {

    @Published var iban: String
    
    init(iban: String) {
        self.iban = iban
    }
}

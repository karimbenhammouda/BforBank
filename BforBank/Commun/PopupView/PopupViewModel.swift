//
//  PopupViewModel.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/25/24.
//

import SwiftUI

class PopupViewModel: ObservableObject {

    @Published var iban: String
    @Published var sheetManager: SheetManager
    
    init(iban: String) {
        self.iban = iban
        self.sheetManager = SheetManager()
    }
}

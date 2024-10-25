//
//  ContentPopupViewModel.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/25/24.
//

import SwiftUI

class ContentPopupViewModel: ObservableObject {

    @Published var iban: String
    @Published var sheetManager: SheetManager
    
    init(iban: String, sheetManager: SheetManager) {
        self.iban = iban
        self.sheetManager = sheetManager
    }
}

//
//  SheetManager.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import Foundation

final class SheetManager: ObservableObject {
    
    enum Action {
        case none
        case present
        case dismiss
    }
    
    @Published private(set) var action: Action = .none
    
    
    func present() {
        guard !action.isPresented else { return }
        self.action = .present
    }
    
    func dismiss() {
        self.action = .dismiss
        self.action.isPresented = true
    }
}

extension SheetManager.Action {
    var isPresented: Bool {
        get { self == .present }
        set {
            self = .none
        }
    }
}

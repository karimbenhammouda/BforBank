//
//  HomeViewModel.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    let coordinator: HomeCoordinator
    
    init(coordinator: HomeCoordinator) {
        self.coordinator = coordinator
    }
}

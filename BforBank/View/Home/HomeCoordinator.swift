//
//  HometCoordinator.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import SwiftUI
import VisionKit

public enum Destination: Codable, Hashable {
    case textScan
    case textImport
}

struct HomeCoordinator: View {
    var body: some View {
        VStack {
            HomeView()
            .listStyle(PlainListStyle())
            .navigationBarTitle("Ajouter un bénéficiaire", displayMode: .inline)
        }
    }
}

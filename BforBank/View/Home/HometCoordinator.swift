//
//  HometCoordinator.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import SwiftUI

struct HomeCoordinator: View {

    var body: some View {
        VStack {
            HomeView()
            .listStyle(PlainListStyle())
            .navigationBarTitle("Ajouter un bénéficiaire", displayMode: .inline)
        }
    }
}

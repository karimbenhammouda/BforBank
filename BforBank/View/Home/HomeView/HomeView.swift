//
//  HomeView.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var iban: String = ""

    var body: some View {
        VStack {
            Text("Scannez, importez ou saisissez l’IBAN")
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(16)
            
            HStack {
                HomeButtonView(text: "Scanner", image: "scan", tapOnAction: {
                    viewModel.coordinator.navigate(to: .textScan)
                })
                    .padding(16)
                HomeButtonView(text: "Impoter", image: "import", tapOnAction: { 
                    viewModel.coordinator.navigate(to: .textImport)
                })
                    .padding(16)
            }

            UnderlineTextFieldView()
            
            
            
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(coordinator: HomeCoordinator()))
    }
}




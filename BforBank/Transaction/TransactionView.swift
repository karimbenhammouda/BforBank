//
//  TransactionView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI

struct TransactionView: View {
    @State var iban: String = ""
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Scannez, importez ou saisissez l’IBAN")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                
                HStack {
                    NavigationLink(destination: ScanView{value in 
                        iban = value
                    }) {
                        ButtonView(text: "Scanner", image: "scan")
                            .padding(16)
                            .tag("Scannerbtn")
                    }
                    
                    ButtonView(text: "Importer", image: "import")
                        .padding(16)
                        .tag("Importerbtn")
                }
                
                UnderlineTextFieldView()
                    .environmentObject(UnderlineTextFieldViewModel(iban: iban))
                Spacer()
            }
            .navigationBarTitle("Ajouter un bénéficiaire", displayMode: .inline)
        }
    }
}

#Preview {
    TransactionView()
}

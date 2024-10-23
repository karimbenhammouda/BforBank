//
//  HomeView.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import SwiftUI

struct HomeView: View {
    @State private var iban: String = ""
    @State var answer = false

    var body: some View {
        NavigationView {
            VStack {
                Text("Scannez, importez ou saisissez l’IBAN")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(16)
                
                
                VStack {
                    NavigationLink(destination: TextScanView( shouldPopToRootView: $answer).environmentObject(TextScanViewModel()), isActive: $answer, label: {
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                HomeButtonView(text: "Scanner", image: "scan", tapOnAction: {
                                    answer = true
                                }).padding(16)
                                
                                HomeButtonView(text: "Importer", image: "import", tapOnAction: {
                                    answer = true
                                }).padding(16)
                            }
                            
                        })
                    })
                }
                UnderlineTextFieldView()
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

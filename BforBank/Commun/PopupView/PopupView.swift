//
//  PopupView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI
struct PopupView: View {
    
    @EnvironmentObject var vm: PopupViewModel
    @State var sheetManager: SheetManager = SheetManager()
    
    let didClose: () -> Void
    let didValidate: () -> Void

    var body: some View {
        VStack {
            title
            subTitle
            iban
            validateButton
            cancelButton
        }.padding()
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(.center)
            .background(.white)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            .transition(.move(edge: .bottom))
            .onDisappear {
                sheetManager.present()
            }
    }
}

#Preview {
    PopupView(sheetManager: SheetManager(), didClose: {}, didValidate: {})
        .padding()
        .background(.blue)
        .environmentObject(PopupViewModel(iban: ""))
}

private extension PopupView {
    var title: some View {
        Text("L'IBAN du bénéficaire a été scanné")
            .font(
                .system(size: 18, weight: .bold, design: .rounded)
            ).padding(.top, 5)
    }
    
    var subTitle: some View {
        Text("Pensez à le vérifier avant de valider :")
            .font(
                .system(size: 18, weight: .regular, design: .rounded)
            ).padding(.top, 5)
    }
    
    var iban: some View {
        Text(vm.iban)
            .font(
                .system(size: 16, weight: .bold, design: .rounded)
            ).padding(.top, 5)
    }
    
    var validateButton: some View {
        Button {
            didValidate()
        } label: {
            HStack {
                Text("Valider")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 16))
                    .padding()
                    .foregroundColor(.white)
            }
            .background(.green) // If you have this
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.green, lineWidth: 1)
            ).padding(.top, 25)
        }
    }
    
    var cancelButton: some View {
        Button {
            didClose()
        } label: {
            HStack {
                Text("Recommencer")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 16))
                    .padding()
                    .foregroundColor(.black)
            }
            .background(.white) // If you have this
            .cornerRadius(25)
            .overlay(
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.green, lineWidth: 1)
            ).onDisappear{
                sheetManager.present()
            }
        }
    }
}

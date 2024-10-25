//
//  ContentPopupView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI
struct ContentPopupView: View {
    
    @EnvironmentObject var vm: ContentPopupViewModel
    let didValidate: () -> Void

    var body: some View {
        ZStack(alignment: .bottom) {
            Color
                .clear
                .ignoresSafeArea()
            if vm.sheetManager.action.isPresented {
                PopupView {
                    withAnimation {
                        vm.sheetManager.dismiss()
                    }
                } didValidate: {
                    withAnimation {
                        vm.sheetManager.dismiss()
                        didValidate()
                    }
                }
                    .environmentObject(PopupViewModel(iban: vm.iban))
            }
        }.onAppear {
            vm.sheetManager.present()
        }
    }
}
 
#Preview {
    ContentPopupView{}
        .environmentObject(ContentPopupViewModel(iban: "", sheetManager: SheetManager()))
}

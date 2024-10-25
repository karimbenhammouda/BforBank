//
//  UnderlineTextFieldView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI
 
struct UnderlineTextFieldView: View {
    @EnvironmentObject var vm: UnderlineTextFieldViewModel
    
    var body: some View {
        VStack {
            
            TextField("FR76 XXXX", text: $vm.iban)
                .padding(.horizontal, 30).padding(.top, 20)
            
            Divider()
                .padding(.horizontal, 30)
            Spacer()
        }
    }
}

#Preview {
    UnderlineTextFieldView().environmentObject(UnderlineTextFieldViewModel(iban: ""))
}

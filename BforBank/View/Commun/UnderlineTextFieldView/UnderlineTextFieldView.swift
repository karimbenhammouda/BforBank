//
//  UnderlineTextFieldView.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import SwiftUI
 
struct UnderlineTextFieldView: View {
    @State private var iban: String = ""
    
    var body: some View {
        VStack {
            
            TextField("iban", text: $iban)
                .padding(.horizontal, 30).padding(.top, 20)
            
            Divider()
                .padding(.horizontal, 30)
            Spacer()
        }
    }
}

struct UnderlineTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        UnderlineTextFieldView()
    }
}

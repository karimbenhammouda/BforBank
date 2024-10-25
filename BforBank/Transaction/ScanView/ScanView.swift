//
//  ScanView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI

struct ScanView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let didClose: (_ value: String) -> Void

    var body: some View {
        NavigationView {
            VStack {
                CameraScanView{value in
                    didClose(value)
                    presentationMode.wrappedValue.dismiss()
                }
            }.navigationBarTitle("Scanner Votre Iban", displayMode: .inline)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.blue.opacity(0.2))
        }
    }
}

#Preview {
    ScanView{value in }
}

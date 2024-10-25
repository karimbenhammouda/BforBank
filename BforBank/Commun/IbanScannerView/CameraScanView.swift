//
//  CameraScanView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI

struct CameraScanView: View {
    @State private var ibanNumber: String = ""
    @StateObject var sheetManager = SheetManager()
    let didClose: (_ value: String) -> Void
    
  var body: some View {
    ZStack {
      IbanScannerView { ibanNumber in
        self.ibanNumber = ibanNumber
      }

      if !ibanNumber.isEmpty {
          let vm = ContentPopupViewModel(iban: ibanNumber, sheetManager: sheetManager)
          ContentPopupView{
              didClose(ibanNumber)
          }
              .environmentObject(vm)
      }
    }
  }
}

#Preview {
    CameraScanView{_ in }
}

private struct PopupTypeView<Content> : View where Content : View {
    let title: String
    var detail: String = ""
    @ViewBuilder let icon: () -> Content
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
            
            HStack {
                icon()
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .font(.system(size: 18))
                        .foregroundColor(.black)
                    Text(detail)
                        .font(.system(size: 13))
                        .foregroundColor(.black)
                        .opacity(0.4)
                }
            }
            .padding()
        }
        .padding(.horizontal, 20)
    }
}

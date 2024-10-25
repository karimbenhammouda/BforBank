//
//  ButtonView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let image: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .frame(width: 32.0, height: 32.0)
                .padding(.leading, 8)
            Text(text)
                .frame(minWidth: 0, maxWidth: .infinity)
                .font(.system(size: 16))
                .padding()
                .foregroundColor(.black)
        }
        .background(.white) // If you have this
        .cornerRadius(25)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(.blue, lineWidth: 1)
        )
    }
}

#Preview {
    ButtonView(text: "Scan", image: "scan")
}

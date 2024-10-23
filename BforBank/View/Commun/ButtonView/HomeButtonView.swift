//
//  HomeButtonView.swift
//  BforBank
//
//  Created by karim on 23/10/2024.
//

import SwiftUI

struct HomeButtonView: View {
    let text: String
    let image: String
    let tapOnAction: () -> Void?
    
    var body: some View {
        Button(action: {
            tapOnAction()
        }) {
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

struct HomeButtonView_Previews: PreviewProvider {
    static var previews: some View {
        HomeButtonView(text: "Scan", image: "scan", tapOnAction: {
            print("Test")
        })
    }
}

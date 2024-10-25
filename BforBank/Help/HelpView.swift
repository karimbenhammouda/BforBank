//
//  HelpView.swift
//  BforBank
//
//  Created by Karim Ben Hammouda on 10/24/24.
//

import SwiftUI

struct HelpView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Help Screen")
            }.navigationBarTitle("Aide", displayMode: .inline)
        }
    }
}

#Preview {
    HelpView()
}

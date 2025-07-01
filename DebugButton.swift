//
//  DebugButton.swift
//  VPetGo
//
//  Created by Reese Hooks on 6/28/25.
//


import SwiftUI

struct DebugButton: View {
    var title: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.caption)
                .foregroundColor(.white)
                .padding()
                .frame(width: 100, height: 50)
                .background(Color.red)
                .cornerRadius(8)
        }
    }
}

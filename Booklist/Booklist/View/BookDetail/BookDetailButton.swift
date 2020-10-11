//
//  BookDetailButton.swift
//  Booklist
//
//  Created by Marco Porcho on 11/10/20.
//

import SwiftUI

struct BookDetailButton: View {
    
    var text: String
    var buttonColor: Color
    
    var body: some View {
        HStack {
            Text(text)
                .fontWeight(.semibold)
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(buttonColor)
        .cornerRadius(40)
    }
}

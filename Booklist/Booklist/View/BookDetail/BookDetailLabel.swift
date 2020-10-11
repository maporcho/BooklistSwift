//
//  BookDetailLabel.swift
//  Booklist
//
//  Created by Marco Porcho on 11/10/20.
//

import SwiftUI

struct BookDetailLabel: View {
    var text: String

        var body: some View {
            
            Text(text)
                .fontWeight(.semibold)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 1)
                )
        }
}

struct BookDetailLabel_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailLabel(text: "Fantasy")
    }
}

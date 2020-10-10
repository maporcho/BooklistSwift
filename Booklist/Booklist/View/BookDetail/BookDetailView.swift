//
//  BookDetailView.swift
//  Booklist
//
//  Created by Marco Porcho on 10/10/20.
//

import SwiftUI

struct BookDetailView: View {
    
    init(service: BookService, bookId: Int) {
        //TODO
    }
    
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(service: MockBookService(), bookId: 1)
    }
}

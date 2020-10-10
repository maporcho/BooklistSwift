//
//  BookListViewModel.swift
//  Booklist
//
//  Created by Marco Porcho on 10/10/20.
//

import Foundation

class BookListViewModel: ViewModel {

    @Published
    var state: BookListState

    init(service: BookService) {
        let books = MockBookService().bookList()
        self.state = BookListState(service: service, books: books)
    }

    func trigger(_ input: Never) { }
}

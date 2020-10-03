//
//  BookService.swift
//  Booklist
//
//  Created by Marco Porcho on 03/10/20.
//

protocol BookService {
    // Book list
    func bookList() -> [Book]

    // Book detail
    func bookDetails(bookId: Int) -> BookDetail
    func numberOfCartItems() -> Int
    func addToCart(bookId: Int)

    // Cart
    func cartItems() -> Cart
    func checkout()
}

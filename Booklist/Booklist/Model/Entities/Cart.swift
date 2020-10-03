//
//  Cart.swift
//  Booklist
//
//  Created by Marco Porcho on 03/10/20.
//

struct Item: Identifiable {
    var id: String
    var item: Book
    var units: Int
}

struct Cart {
    var items: [Item]
    var numberOfItems: Int
    var total: Double
}

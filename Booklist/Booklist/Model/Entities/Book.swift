//
//  Book.swift
//  Booklist
//
//  Created by Marco Porcho on 03/10/20.
//

struct Book: Identifiable {
    var id: Int
    var title: String
    var author: String
    var price: Double
    var imageName: String
}

extension Book {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

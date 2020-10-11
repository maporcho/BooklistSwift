//
//  CartViewModel.swift
//  Booklist
//
//  Created by Marco Porcho on 11/10/20.
//

import Foundation

class CartViewModel: ViewModel {

    @Published
    var state: CartState
    private var service: BookService

    init(service: BookService) {
        let cart = service.cartItems()
        self.state = CartState(cart: cart)
        self.service = service
    }

    func trigger(_ input: CartInput) {
        switch input {
        case .checkout:
            service.checkout()
            state.cart = service.cartItems()
        }
    }
    
}

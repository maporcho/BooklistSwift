//
//  CartButtonView.swift
//  Booklist
//
//  Created by Marco Porcho on 11/10/20.
//

import SwiftUI

struct CartButtonView: View {
    var numberOfItems: Int

    var body: some View {
        VStack {
            Image("shopping_cart")
                .resizable()
                .scaledToFit()
                .frame(width: 24, height: 24, alignment: .center)
                .foregroundColor(.black)
            
            
            
            Text(String(numberOfItems))
                .font(.system(size: 8))
                .foregroundColor(.black)
                .padding(.top, -8)
            
        }
    }

    struct ImageOverlay: View {
        var numberOfItems: Int

        var body: some View {
            ZStack {
                Text(String(numberOfItems))
                    .font(.system(size: 12))
                    .foregroundColor(.black)
                    .padding(5)
            }
        }
    }
}

struct CartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        CartButtonView(numberOfItems: 3)
    }
}

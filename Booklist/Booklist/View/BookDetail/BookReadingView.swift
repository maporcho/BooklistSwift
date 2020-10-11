//
//  BookReadingView.swift
//  Booklist
//
//  Created by Marco Porcho on 11/10/20.
//

import SwiftUI

struct BookReadingView: View {
    
    var titleBook: String
    
    @Binding var show: Bool
    
    var body: some View {
        VStack {
            // Dismiss button
            Button(action: {
                self.show.toggle()
            }) {
                HStack() {
                    Image("icon_close")
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: 32, height: 32)
                    .padding(20)

                    Spacer()
                }
            }
            
            Text(titleBook)
                .font(.largeTitle)
            
            Divider()
                .padding(.top, 1)
                .padding([.leading, .trailing], 20)
                .padding(.bottom, 20)
            
            Text("Mussum ipsum cacilds, vidis litro abertis. Consetis adipiscings elitis. Pra lá , depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.")
                .padding(30)
            
            
        }
    }
}

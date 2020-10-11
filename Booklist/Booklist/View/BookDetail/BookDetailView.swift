//
//  BookDetailView.swift
//  Booklist
//
//  Created by Marco Porcho on 10/10/20.
//

import SwiftUI

struct BookDetailState {
    var service: BookService
    var bookDetail: BookDetail
    var cartItems: Int
}

enum BookDetailInput {
    case addBookToCart
    case reloadState
}

struct BookDetailView: View {
    
    @ObservedObject
    var viewModel: AnyViewModel<BookDetailState, BookDetailInput>
    
    @State private var showReadingView = false
    @State private var showCheckout = false
    @State private var showAlert = false
    
    init(service: BookService, bookId: Int) {
        self.viewModel = AnyViewModel(BookDetailViewModel(service: service, id: bookId))
    }
    
    
    var body: some View {
        
        VStack {
            BookDetailImage(image: viewModel.state.bookDetail.image)
            
            Spacer()
                .frame(height: 30)
            
            Text(viewModel.state.bookDetail.author)
                .foregroundColor(.gray)
            
            Text(viewModel.state.bookDetail.title)
                .font(.system(size: 24, weight: .semibold))
                .padding([.leading, .trailing], 20)
            
            Spacer()
                .frame(height: 20)
            
            Text(viewModel.state.bookDetail.description)
                .lineLimit(4)
                .padding([.leading, .trailing], 20)
                .lineSpacing(6)
                .foregroundColor(.gray)
            
            Spacer()
                .frame(height: 20)
            
            HStack(spacing: 20) {
                ForEach(0 ..< viewModel.state.bookDetail.genre.count, id: \.self){ index in
                    
                    BookDetailLabel(text: viewModel.state.bookDetail.genre[index].description)
                    
                }
                
                BookDetailLabel(text: viewModel.state.bookDetail.kind)
                
            }
            .padding(.bottom, 10)
            
            Divider()
                .padding(.bottom, 30)
                .padding([.leading, .trailing], 20)
            
            if viewModel.state.bookDetail.isAvailable {
                Button(action: {self.showReadingView = true}){
                    BookDetailButton(text: "Read", buttonColor: Color.green)
                }
                .sheet(isPresented: self.$showReadingView ){
                    BookReadingView(titleBook: self.viewModel.state.bookDetail.title, show: self.$showReadingView)
                }
            } else {
                Button(action: {
                    self.addToCart()
                    self.showAlert = true
                }){
                    BookDetailButton(text: "Buy for $\(viewModel.state.bookDetail.price)", buttonColor: Color.black)
                }
                .alert(isPresented: $showAlert){
                    Alert(title: Text("Book added to cart"), message: Text("You're ready to proceed to checkout."), dismissButton: .default(Text("Done")))
                    
                }
            }
        }
            
        .navigationBarItems(trailing:
            Button(action: {
                self.showCheckout = true
            }) {
                CartButtonView(numberOfItems: self.viewModel.state.cartItems)
            }.sheet(isPresented: self.$showCheckout, onDismiss: { self.reload() }) {
                CartView(service: self.viewModel.state.service, showModal: self.$showCheckout)
            })
        .navigationBarTitle(Text(""), displayMode: .inline)
            
            
        
    }
}

// MARK: - Private extension
private extension BookDetailView {
    func addToCart() {
        viewModel.trigger(.addBookToCart)
    }

    func reload() {
        viewModel.trigger(.reloadState)
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(service: MockBookService(), bookId: 1)
    }
}

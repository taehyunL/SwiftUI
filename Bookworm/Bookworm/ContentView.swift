//
//  ContentView.swift
//  Bookworm
//
//  Created by 이태현 on 2022/02/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    var body: some View {
        NavigationView {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)

                            VStack(alignment: .leading) {
                                if book.rating != 1 {
                                Text(book.title! != "" ? book.title! : "No title")
                                    .font(.headline)
                                } else {
                                    Text(book.title! != "" ? book.title! : "No title")
                                        .foregroundColor(.red)
                                        .font(.headline)
                                }
                                Text(book.author! != "" ? book.author! : "Unknown Author")
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
           .navigationTitle("Bookworm")
           .toolbar {
               ToolbarItem(placement: .navigationBarLeading) {
                   EditButton()
               }
               
               ToolbarItem(placement: .navigationBarTrailing) {
                   Button {
                       showingAddScreen.toggle()
                   } label: {
                       Label("Add Book", systemImage: "plus")
                   }
               }
           }
           .sheet(isPresented: $showingAddScreen) {
               AddBookView()
           }
       }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            moc.delete(book)
            
            try? moc.save()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

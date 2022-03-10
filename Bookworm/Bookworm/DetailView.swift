//
//  DetailView.swift
//  Bookworm
//
//  Created by 이태현 on 2022/03/07.
//

import SwiftUI

struct DetailView: View {
    var book: Book
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    static let dateformat: DateFormatter = {
          let formatter = DateFormatter()
           formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
           return formatter
       }()
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                if book.genre?.count != 0 {
                    Image(book.genre!)
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "questionmark.square.fill")
                        .resizable()
                        .scaledToFit()
                }
                //questionmark.square.fill
                Text(book.genre != "" ? book.genre!.uppercased() : "Default")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding()
                    .foregroundColor(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)

            }

            Text(book.author != "" ? book.author! : "Unknown author")
                .font(.title)
                .foregroundColor(.secondary)

            Text(book.review != "" ? book.review! : "No review")
                .padding()

            RatingView(rating: .constant(Int(book.rating)))
                .font(.largeTitle)

            Text("saved date : \(book.date!, formatter: DetailView.dateformat)")
                .padding()
            
        }
        .alert("Delete book", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteBook)
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert.toggle()
            } label: {
                Label("Delete this book", systemImage: "trash")
            }
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
    }

    func deleteBook() {
        moc.delete(book)

        try? moc.save()
    }
}

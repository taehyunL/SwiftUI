//
//  ContentView.swift
//  Friendface
//
//  Created by 이태현 on 2022/03/19.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.users) { user in
                    NavigationLink {
                        DetailView(user: user)
                    } label: {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("active status: \(String(user.isActive))")
                                Text(user.name)
                            }
                            Spacer()
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }

                }
            }
            .navigationTitle("")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

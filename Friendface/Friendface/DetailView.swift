//
//  DetailView.swift
//  Friendface
//
//  Created by 이태현 on 2022/03/19.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            ForEach(user.friends) { friend in
                Text(friend.name)
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

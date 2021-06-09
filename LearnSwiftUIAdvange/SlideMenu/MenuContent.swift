//
//  MenuContent.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 6/8/21.
//

import SwiftUI

struct MenuContent: View {
    var body: some View {
        VStack{
            Text("List Menu")
            Spacer(minLength: 30)
            List {
                Text("My Profile").onTapGesture {
                    print("My Profile")
                }
                Text("Posts").onTapGesture {
                    print("Posts")
                }
                Text("Logout").onTapGesture {
                    print("Logout")
                }
            }
        }
    }
}

struct MenuContent_Previews: PreviewProvider {
    static var previews: some View {
        MenuContent()
    }
}

//
//  SwiftUINextView.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 4/14/21.
//

import SwiftUI

struct SwiftUINextView: View {
    @State var displayName:String
    var body: some View {
        Text("Hello, \(displayName)")
    }
}

struct SwiftUINextView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINextView(displayName: "")
    }
}

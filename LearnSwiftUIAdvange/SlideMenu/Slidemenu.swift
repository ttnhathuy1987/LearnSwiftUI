//
//  Slidemenu.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 6/8/21.
//

import SwiftUI

struct Slidemenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
        
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}

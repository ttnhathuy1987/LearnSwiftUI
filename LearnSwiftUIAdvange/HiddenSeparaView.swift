//
//  HiddenSeparaView.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 4/14/21.
//

import SwiftUI

struct HiddenSeparaView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

extension View {
    
    func hideListRowSeparator() -> some View {
        return customListRowSeparator(insets: .init(), insetsColor: .clear)
    }
    
    func customListRowSeparator(
        insets: EdgeInsets,
        insetsColor: Color) -> some View {
        modifier(HideRowSeparatorModifier(insets: insets,
                                          background: insetsColor
        )) .onAppear {
            UITableView.appearance().separatorStyle = .none
            UITableView.appearance().separatorColor = .clear
        }
    }
}

// MARK: ViewModifier

private struct HideRowSeparatorModifier: ViewModifier {
        
    var insets: EdgeInsets
    var background: Color
    
    func body(content: Content) -> some View {
        content
            .padding(insets)
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading
            )
            .listRowInsets(EdgeInsets())
            .background(background)
    }
}

struct HiddenSeparaView_Previews: PreviewProvider {
    static var previews: some View {
        HiddenSeparaView()
    }
}

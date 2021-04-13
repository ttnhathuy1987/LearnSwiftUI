//
//  ContentView.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 4/13/21.
//

import SwiftUI

struct People: Identifiable {
    let id = UUID()
    var name:String = ""
    var addres:String = ""
    
    static func createRandomPeople() -> People {
        var item = People()
        item.name = "Name: \(arc4random()%100)"
        item.addres = "Address: \(item.name) is on \(arc4random()%19)"
        return item
    }
}

struct ContentView: View {
    
    @State var listItemPeople:[People] = []
    @State var username: String = ""
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Username")
                    .font(.callout)
                    .bold()
                TextField("Enter username...", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button("Add") {
                        listItemPeople.append(People.createRandomPeople())
                    }
                    Spacer()
                    Button("Delete") {
                        if listItemPeople.count > 0 {
                            listItemPeople.removeLast()
                        }
                    }
                }
            }.padding()
            List {
                ForEach(listItemPeople) { item in
                    Text(item.name)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

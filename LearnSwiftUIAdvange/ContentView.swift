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
    @State private var showingAlert = false
    @State var isNavigationFirstView = false
    @State var isNavigationSecondView = false
    @EnvironmentObject var notificationCenter :NotificationCenter
    
    
    @State var menuOpen: Bool = false
    
    
    func openMenu() {
        self.menuOpen.toggle()
    }
    
    var body: some View {

            NavigationView {
                VStack {
                    VStack(alignment: .leading) {
                        Text("Username")
                            .font(.callout)
                            .bold()
                        TextField("Enter username...", text: $username)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        HStack {
                            Button("Add") {
                                if (username.isEmpty) {
                                    showingAlert = true
                                } else {
                                    listItemPeople.append(People.createRandomPeople())
                                }
                                
                                
                            }.alert(isPresented: $showingAlert) {
                                Alert(title: Text("Error"), message: Text("Please fill User Name"), dismissButton:.cancel(Text("OK")))
                            }
                            
                            if !self.menuOpen {
                                Spacer()
                                Button(action: {
                                    self.openMenu()
                                }, label: {
                                    Text("Open")
                                })
                            }
                            
                            Spacer()
                            Button("Delete") {
                                if listItemPeople.count > 0 {
                                    listItemPeople.removeLast()
                                }
                            }
                            
                        }
                    }.padding(.horizontal)
                    List {
                        ForEach(listItemPeople) { item in
                            NavigationLink(destination: SwiftUINextView(displayName: item.name)){
                                Text(item.name)
                            }
                        }
                        .listRowInsets( EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 10) )
                    }
                    .listStyle(InsetListStyle())
                    .onAppear {
                     UITableView.appearance().separatorStyle = .none
                    }
                }
                .navigationBarTitle(Text("List item").font(.caption))
                .toolbar(content: {
                    ToolbarItemGroup(placement: .bottomBar) {
                       
                     
                        Button("Login") {
                            self.isNavigationFirstView = true
                        }

                        Button("Test Notification") {
                            self.isNavigationSecondView = true
                            
                        }
                    }
                }).background(
                    HStack {
                        NavigationLink(destination: SwiftUINextView(displayName: "Test Navigation"), isActive: $isNavigationFirstView) {
                            EmptyView()
                        }
                        NavigationLink(destination: LocalNotificationDemoView().environmentObject(notificationCenter), isActive: $isNavigationSecondView) {
                            EmptyView()
                        }
                    }
                )
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(NotificationCenter())
    }
}

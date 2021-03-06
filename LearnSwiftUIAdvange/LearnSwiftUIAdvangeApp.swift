//
//  LearnSwiftUIAdvangeApp.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 4/13/21.
//

import SwiftUI
import os

@main
struct LearnSwiftUIAdvangeApp: App {
    @StateObject var notificationCenter = NotificationCenter()
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    @State var menuOpen: Bool = false
    
    func openMenu() {
        self.menuOpen.toggle()
    }
    
    struct MenuView: View {
        @Binding var menuOpen: Bool
        var body: some View {
            VStack(alignment: .leading) {
                HStack {
                    Button("Menu") {
                        self.menuOpen.toggle()
                    }.padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                    Spacer()
                }
            }.frame(maxWidth: .infinity).background(Color.red)
        }
    }
    
    var body: some Scene {
        WindowGroup {
            VStack(spacing:0) {
                MenuView(menuOpen: $menuOpen)
                ZStack {
                    ContentView().environmentObject(notificationCenter)
                    Slidemenu(width: 270, isOpen: self.menuOpen,menuClose: self.openMenu)
                }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    //No callback in simulator -- must use device to get valid push token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print(deviceToken)
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print(error.localizedDescription)
    }
}

class NotificationCenter: NSObject, ObservableObject {
    @Published var dumbData: UNNotificationResponse?
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
}

extension NotificationCenter: UNUserNotificationCenterDelegate  {
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list, .banner, .sound, .badge])
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        dumbData = response
        completionHandler()
    }

    func userNotificationCenter(_ center: UNUserNotificationCenter, openSettingsFor notification: UNNotification?) { }
}

extension UIApplicationDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        print("Successfully registered for notifications!")
    }

    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for notifications: \(error.localizedDescription)")
    }
}

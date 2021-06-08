//
//  LocalNotificationDemoView.swift
//  LearnSwiftUIAdvange
//
//  Created by s3 on 6/8/21.
//

import SwiftUI

struct LocalNotificationDemoView: View {
    @StateObject var localNotification = LocalNotification()
    @EnvironmentObject var notificationCenter: NotificationCenter
        var body: some View {
            VStack {
                Button("schedule Notification") {
                    localNotification.setLocalNotification(title: "title",
                                                           subtitle: "Subtitle",
                                                           body: "this is body",
                                                           when: 10)
                }
                
                if let dumbData = notificationCenter.dumbData  {
                    Text("Old Notification Payload:")
                    Text(dumbData.actionIdentifier)
                    Text(dumbData.notification.request.content.body)
                    Text(dumbData.notification.request.content.title)
                    Text(dumbData.notification.request.content.subtitle)
                }
            }
        }
}

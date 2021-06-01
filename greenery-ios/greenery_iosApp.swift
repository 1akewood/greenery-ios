//
//  greenery_iosApp.swift
//  greenery-ios
//
//  Created by Heap on 2021/05/31.
//


import SwiftUI

@main
struct greenery_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

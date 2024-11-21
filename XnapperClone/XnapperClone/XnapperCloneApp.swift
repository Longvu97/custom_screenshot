//
//  XnapperCloneApp.swift
//  XnapperClone
//
//  Created by Long Vu on 15/11/24.
//

import SwiftUI

@main
struct XnapperCloneApp: App {
    @StateObject private var vm = ScreenShotViewModel()
    @State var isInserted = true
    var body: some Scene {
        MenuBarExtra("XnapperClone", systemImage: "camera.viewfinder", isInserted: $isInserted) {
            MenuBarView(vm: vm)
        }

        WindowGroup {
            ContentView(vm: vm)
        }
    }
}

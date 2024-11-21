//
//  ContentView.swift
//  XnapperClone
//
//  Created by Long Vu on 15/11/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var vm = ScreenShotViewModel()

    var body: some View {
        MainView(vm: vm)
            .environmentObject(SetupModel())
    }
}

#Preview {
    ContentView()
}

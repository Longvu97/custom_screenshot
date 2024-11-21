//
//  MenuBarView.swift
//  XnapperClone
//
//  Created by Long Vu on 19/11/24.
//

import SwiftUI

struct MenuBarView: View {
    @ObservedObject var vm = ScreenShotViewModel()

    var body: some View {
        VStack (alignment: .leading) {
            Button(action: {
                vm.takeScreenShot(for: .area)
            }, label: {
                HStack {
                    Image(systemName: "camera.metering.center.weighted.average")
                    Text("Take Screenshot (^⌥⌘1)")
                }
                .padding(5)
            })
            .keyboardShortcut("1", modifiers: [.control, .option, .command])
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                vm.takeScreenShot(for: .full)
            }, label: {
                HStack {
                    Image(systemName: "macwindow")
                    Text("Take Screenshot fullscreen (^⌥⌘2)")
                }
                .padding(5)
            })
            .keyboardShortcut("5", modifiers: [.option, .command])
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                vm.takeScreenShot(for: .window)
            }, label: {
                HStack {
                    Image(systemName: "macwindow.on.rectangle")
                    Text("Take Screenshot window(^⌥⌘3)")
                }
                .padding(5)
            })
            .keyboardShortcut("4", modifiers: [.option, .command])
            .buttonStyle(PlainButtonStyle())
        }
    }
}

#Preview {
    MenuBarView(vm: ScreenShotViewModel())
}

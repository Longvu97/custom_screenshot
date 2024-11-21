//
//  MainView.swift
//  XnapperClone
//
//  Created by Long Vu on 15/11/24.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm = ScreenShotViewModel()

    var body: some View {
        HStack {
            CanvasView(vm: vm)

            Divider()
                .background(Color.black)
            
            SetupView(vm: vm)
               
        }
    }
}

#Preview {
    MainView()
        .frame(width: 200, height: 200)
        .environmentObject(SetupModel())
}

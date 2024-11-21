//
//  CanvasView.swift
//  XnapperClone
//
//  Created by Long Vu on 15/11/24.
//

import SwiftUI

struct CanvasView: View {
    @EnvironmentObject var setupModel: SetupModel
    @ObservedObject var vm: ScreenShotViewModel

    var body: some View {
        ZStack {
            ZStack {
                if vm.screenshot != nil {
                    Image(nsImage: vm.screenshot!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
            }
            .padding(.top, setupModel.inset)
            .padding(.leading, setupModel.inset)
            .background(setupModel.insetColor)
            .cornerRadius(CGFloat(setupModel.rounded))
            .shadow(
                radius: CGFloat(setupModel.shadow),
                x: 9, y: 9
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.vertical, 10)
        .padding(.horizontal, CGFloat(setupModel.padding))
        .background(setupModel.background)
    }
}

#Preview {
    CanvasView(vm: ScreenShotViewModel())
        .environmentObject(SetupModel())
}

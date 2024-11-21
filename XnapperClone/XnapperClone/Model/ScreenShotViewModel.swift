//
//  ScreenShotViewModel.swift
//  XnapperClone
//
//  Created by Long Vu on 18/11/24.
//

import SwiftUI

class ScreenShotViewModel: ObservableObject {
    enum ScreenshotType {
        case full
        case window
        case area
        
        var command: [String] {
            switch self {
            case .full:
                return ["-c"]
            case .window:
                return ["-cw"]
            case .area:
                return ["-cs"]
            }
        }
    }
    
    @Published var screenshot: NSImage? = nil
    
    func takeScreenShot(for type: ScreenshotType) {
        let task = Process()
        task.executableURL = URL(fileURLWithPath: "/usr/sbin/screencapture")
        task.arguments = type.command
        
        do {
            try task.run()
            task.waitUntilExit()
            getImageFromPasteboard()
        } catch {
            print("Error")
        }
        
    }
    
    private func getImageFromPasteboard() {
        guard NSPasteboard.general.canReadItem(withDataConformingToTypes: NSImage.imageTypes) else {
            return
        }
        
        guard let image = NSImage(pasteboard: NSPasteboard.general) else {
            return
        }
        
        print(image)
        
        self.screenshot = image
    }
}

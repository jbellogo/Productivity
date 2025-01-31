//
//  FocusApp.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import SwiftUI

@main
struct FocusApp: App {
    var body: some Scene {
        WindowGroup {
            FocusTaskView(task: Task(title: "Study Math", measurement: "1hr"))
        }
        .windowLevel(.floating) // Use it here.
    }
    
}

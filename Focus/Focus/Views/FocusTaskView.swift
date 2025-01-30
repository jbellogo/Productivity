//
//  FocusTaskView.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import SwiftUI
import AppKit

struct FocusTaskView: View {
    let task: Task
    
    var body: some View {
        VStack(spacing: 8) {
            VStack(spacing: 4) {
                Text("Active Task: \(task.title)")
                    .foregroundColor(.green)
                Text("Time elapsed: \(round(task.timeElapsed))s")
                    .foregroundColor(.white)
            }
            
            HStack(spacing: 16) {
                Button("Pause") {
                    // Action
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                Button("Finish") {
                    // Action
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
                
                Button("Subtask") {
                    // Action
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
        }
        .padding()
        .frame(maxWidth: 300)
        .background(Color.black)
        .cornerRadius(16)
    }
}

#Preview {
    FocusTaskView(task: Task.example())
}


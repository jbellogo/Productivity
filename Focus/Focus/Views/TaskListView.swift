//
//  TaskListView.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import SwiftUI

struct TaskListView: View {
    let tasks : TaskGroup
    var body: some View {
        for task in tasks {
            HStack {
                Text(task.title)
            }
        }
    }
}

#Preview {
    TaskListView(tasks : TaskGroup.examples())
}

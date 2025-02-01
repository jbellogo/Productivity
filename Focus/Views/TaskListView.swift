//
//  TaskListView.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import SwiftUI

struct TaskListView: View {
    let myCategory : Category;
      var body: some View {
        List {
            ForEach(myCategory.tasks) { task in
                HStack {
                    Text(task.title)
                    // Text("|")
                    Spacer().frame(width: 50)
                    Text(task.measurement)
                        .frame(alignment: .leading)

                    if let averageTime = task.averageTime {
                        Text(String(format: "%.1f min", averageTime / 60))
                    }    
                    
                                    
                    Spacer()
                    
                    NavigationLink(destination: FocusTaskView(task: task)) {
                        Text("Start")
                    }
                    .frame(width: 60, height: 20, alignment: .center)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                }
            }
        }
    }
}

#Preview {
    TaskListView(myCategory: Category.example())
}

//
//  TaskGroup.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import Foundation


struct TaskGroupIterator: IteratorProtocol {
    private var currentIndex = 0
    private let tasks: [Task]

    init(tasks: [Task]) {
        self.tasks = tasks
    }

    mutating func next() -> Task? {
        guard currentIndex < tasks.count else { return nil }
        defer { currentIndex += 1 }
        return tasks[currentIndex]
    }
}

class TaskGroup: Identifiable, Sequence {
    let id: UUID = UUID()
    var title: String
    var tasks: [Task] = []
    
    init(title: String) {
        self.title = title
    }
    
    // Conforming to Sequence (to be able to call: for i in taskGroup)
    func makeIterator() -> TaskGroupIterator {
        return TaskGroupIterator(tasks: tasks)
    }
        
    func addTask(_ task: Task) -> Void {
        self.tasks.append(task)
    }
    
    func deleteTask(at id: UUID) -> Void {
        for task in tasks where task.id == id {
            if let index = self.tasks.firstIndex(of: task) {
                self.tasks.remove(at: index)
            }
        }
    }
    
    static func examples() -> TaskGroup {
        let task1 = Task(title: "Leetcode")
        let task2 = Task(title: "Poker project")
        let task3 = Task(title: "Job Applications")
        let group = TaskGroup(title: "Professional")
        group.tasks = [task1, task2]
        return group
    }
}

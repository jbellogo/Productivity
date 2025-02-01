//
//  Category.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import Foundation


struct CategoryIterator: IteratorProtocol {
    private var currentIndex = 0
    private let tasks: [Task]
    var color: String = "blue" // To distinguish between categories

    init(tasks: [Task]) {
        self.tasks = tasks
    }

    mutating func next() -> Task? {
        guard currentIndex < tasks.count else { return nil }
        defer { currentIndex += 1 }
        return tasks[currentIndex]
    }
}

class Category: Identifiable, Sequence {
    var title: String
    var tasks: [Task] = []
    
    init(title: String) {
        self.title = title
    }
    
    // Conforming to Sequence (to be able to call: for task in category)
    func makeIterator() -> CategoryIterator {
        return CategoryIterator(tasks: tasks)
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
    
    static func example() -> Category {
        let task1 = Task(title: "Leetcode", measurement: "1 question")
        let task2 = Task(title: "Poker project", measurement: "1 commit")
        let task3 = Task(title: "Notes project", measurement: "1hr")
        let group = Category(title: "Programming")
        group.tasks = [task1, task2, task3]
        return group
    }
}

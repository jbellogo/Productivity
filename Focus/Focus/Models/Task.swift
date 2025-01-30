//
//  File.swift
//  Focus
//
//  Created by Juan Bello on 2025-01-30.
//

import Foundation

class Task : Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
    var description: String?
    
    @Published var isCompleted: Bool = false
    @Published var timeElapsed: TimeInterval = 0
    
    private var timer: Timer? = nil
    private var startTime: Date? = nil

    // Maybe subtasks?
    
    
    init(title: String, description: String? = nil) {
        self.title = title
        self.description = description
    }
    
    // Equatable
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    func startTimer() {
        startTime = Date()
        timer?.invalidate() // Invalidate any existing timer
        
        // The trailing closure { ... } is the code block that gets executed every time the timer fires.
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
            [weak self] _ in
            guard let self = self, let startTime = self.startTime else { return }
            self.timeElapsed = Date().timeIntervalSince(startTime)
       }
   }

   func stopTimer() {
       timer?.invalidate()
       timer = nil
   }
    
    static func example() -> Task{
        let task = Task(title: "Learn SwiftUI")
        return task
    }
}


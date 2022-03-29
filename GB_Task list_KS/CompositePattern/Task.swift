//
//  Task.swift
//  GB_Task list_KS
//
//  Created by Константин Шмондрик on 28.03.2022.
//

import Foundation

// , Identifiable, ObservableObject

class Task: TaskComposite {
    
    var parent: TaskComposite?
    var children: [Task] = []
    var name: String
    
    init(name: String, parent: TaskComposite?) {
        self.name = name
        self.parent = parent
    }
    
    func add(child: Task) {
        children.append(child)
    }
}



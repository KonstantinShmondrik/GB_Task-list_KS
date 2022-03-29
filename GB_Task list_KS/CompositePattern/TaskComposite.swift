//
//  TaskComposite.swift
//  GB_Task list_KS
//
//  Created by Константин Шмондрик on 28.03.2022.
//

import Foundation

protocol TaskComposite {
    
    var parent: TaskComposite? { get }
    var children: [Task] { get set }
    var name: String { get }
    
    func add(child: Task)
}

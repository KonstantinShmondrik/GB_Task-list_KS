//
//  RootListItemTableViewCell.swift
//  GB_Task list_KS
//
//  Created by Константин Шмондрик on 28.03.2022.
//

import UIKit

class RootListItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskName: UILabel!
    
    @IBOutlet weak var subTasksCounter: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

    func configurater(taskName: String, subTasksCounter: Int) {
        self.taskName.text = taskName
        self.subTasksCounter.text = String("\(subTasksCounter)")
    }
    
    
}

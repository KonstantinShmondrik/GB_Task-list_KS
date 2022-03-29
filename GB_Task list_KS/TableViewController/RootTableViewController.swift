//
//  RootTableViewController.swift
//  GB_Task list_KS
//
//  Created by Константин Шмондрик on 28.03.2022.
//

import UIKit

class RootTableViewController: UITableViewController {
    
    @IBOutlet weak var AddSubtasksButton: UIButton!
    
    var myTaskTree = Task(name: "Root tasks", parent: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = myTaskTree.name
        
        //        tableView.register(UINib(nibName: "ListItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ListItemTableViewCell")
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myTaskTree.children.count
    }
    
    // MARK: - cellForRowAt
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RootListItemCell", for: indexPath) as? RootListItemTableViewCell else {return UITableViewCell()}
        
        let taskName = String("\(myTaskTree.children[indexPath.row].name)")
        let subTasksCounter = myTaskTree.children[indexPath.row].children.count
        
        cell.accessoryType = .disclosureIndicator
        
        cell.configurater(taskName: taskName, subTasksCounter: subTasksCounter)
        
        return cell
        
    }
    // MARK: - prepare for segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToSubViewController", let cell = (sender as? UITableViewCell) {
            guard let ctrl = segue.destination as? SubTableViewController else {return}
            if let indexPath = tableView.indexPath(for: cell) {
                
                
                ctrl.task = myTaskTree.children[indexPath.row]
                
            }
        }
    }
    
    // MARK: - удаляем задачу по свайпу впаво
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            myTaskTree.children.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    @IBAction func AddSubtasksButtonActions(_ sender: Any) {
        
        TextAlert().textAlert() { [weak self] userInput in
            guard let self = self else {return}
            guard userInput != "" else { return }
            
            self.myTaskTree.add(child: Task(name: userInput, parent: self.myTaskTree))
            
            self.tableView.reloadData()
        }
        
    }
    
    
    //    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        performSegue(withIdentifier: "GoToSubViewController", sender: self)
    
    //    }
    
    
    
    
}

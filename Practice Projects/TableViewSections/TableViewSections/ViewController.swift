//
//  ViewController.swift
//  TableViewSections
//
//  Created by Harry Dinh on 2023-05-05.
//

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
    }
    
    func tableViewSetup() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return ["Section 1", "Section 2", "Section 3"]
    }
}

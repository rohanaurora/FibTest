//
//  SummaryViewController.swift
//  FibTest App
//
//  Created by Rohan Aurora on 12/6/18.
//  Copyright © 2018 Rohan Aurora. All rights reserved.
//

import UIKit

class SummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var summaryDatasource: [Int:Double] = [:]
    var numbers: [Int] = []
    var times: [Double] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Retrieve data
        for (key, value) in summaryDatasource {
            numbers.append(key)
            times.append(value)
        }
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FibTimeCell", for: indexPath) as? SummaryCell else {
            fatalError("Failed to dequeue a SummaryCell.")
        }
        cell.timeSummary = times[indexPath.row]
        cell.number = numbers[indexPath.row]
        
        return cell
    }
}

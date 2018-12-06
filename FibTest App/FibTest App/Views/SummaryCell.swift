//
//  SummaryCell.swift
//  FibTest App
//
//  Created by Rohan Aurora on 12/6/18.
//  Copyright © 2018 Rohan Aurora. All rights reserved.
//

import UIKit

class SummaryCell: UITableViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    
    var timeSummary: Double? {
        didSet { self.displaySummary() }
    }
    
    var number: Int? {
        didSet { self.displaySummary() }
    }
    
    private func displaySummary() {
        if let num = timeSummary, let input = number {
            elapsedTimeLabel.text = String(num)
            numberLabel.text = String(input)
        }
    }
}

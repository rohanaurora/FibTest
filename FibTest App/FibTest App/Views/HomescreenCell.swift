//
//  HomescreenCell.swift
//  FibTest App
//
//  Created by Rohan Aurora on 12/6/18.
//  Copyright © 2018 Rohan Aurora. All rights reserved.
//

import UIKit

class HomescreenCell: UITableViewCell {
    
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var fibValueLabel: UILabel!
    
    var fibNumber: Int? {
        didSet { self.homescreen() }
    }
    
    private func homescreen() {
        if let num = fibNumber, num >= 0 {
            self.number.text = String(num)
            self.fibValueLabel.text = String(fibonacci(num))
        }
    }

    func fibonacci(_ n: Int) -> Int {
        guard n > 1 else { return n }
        return fibonacci(n-1) + fibonacci(n-2)
    }
}

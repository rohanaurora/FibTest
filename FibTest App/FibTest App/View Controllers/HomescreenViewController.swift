//
//  HomescreenViewController.swift
//  FibTest App
//
//  Created by Rohan Aurora on 12/5/18.
//  Copyright © 2018 Rohan Aurora. All rights reserved.
//

import UIKit

class HomescreenViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet var rightBarButton: UIBarButtonItem!

    fileprivate var inputValue:[Int] = []
    fileprivate var summaryDictionary: [Int : Double] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "FibTest App"
        
        tableView.separatorStyle = .none
        time.text = ""
        textView.delegate = self
        textView.returnKeyType = .done
        textView.placeholder = "Enter a numeric input (0-9)"
        textView.textAlignment = .center
        
        self.navigationController!.navigationBar.barTintColor = UIColor(red: 84/255, green: 191/255, blue: 75/255, alpha: 0.0)
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.rightBarButton.tintColor = UIColor.black
    }
    
    struct SegueIdentifiers {
        static let HomeToSummary: String = "segueHomeToSummary"
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == textView {
            let allowedCharacters = CharacterSet(charactersIn:"0123456789")
            return allowedCharacters.isSuperset(of: CharacterSet(charactersIn: string))
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let input = Int(textField.text!) else { return false }
        processFibinacciData(input)
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    
    func processFibinacciData(_ input:Int) {
        inputValue.append(input)
        self.tableView.reloadData()
        
        let start = CFAbsoluteTimeGetCurrent()
        _ = fibonacci(input)
        let differenceTime = (CFAbsoluteTimeGetCurrent() - start)/1000 // in ms.
        
        self.time.text = ("\(differenceTime) ms.")
        summaryDictionary.updateValue(differenceTime, forKey: input)
        tableView.separatorStyle = .singleLine
    }
    
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifiers.HomeToSummary {
            if let vc:SummaryViewController = segue.destination as? SummaryViewController {
                vc.summaryDatasource = summaryDictionary
            }
        }
    }
    
    // Calculate fibonacci for a number.
    func fibonacci(_ n: Int) -> Int {
        guard n > 1 else { return n }
        return fibonacci(n-1) + fibonacci(n-2)
    }
}

extension HomescreenViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inputValue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FibCell", for: indexPath) as? HomescreenCell else {
            fatalError("Failed to dequeue a HomescreenCell.")
        }
        cell.fibNumber = inputValue[indexPath.row]
        
        return cell
    }
}




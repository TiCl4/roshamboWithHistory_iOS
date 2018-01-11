//
//  HistoryViewController.swift
//  RockPaperScissors
//
//  Created by Nguyen Tran on 1/9/18.
//  Copyright © 2018 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var history : [RPSMatch]!
    
    @IBOutlet weak var dismissButton: UIBarButtonItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyIdentifier", for: indexPath)
        let match = history[(indexPath as NSIndexPath).row]
        
        // Set the results and matches
        cell.textLabel?.text = victoryStatusDescription(match)
        cell.detailTextLabel?.text = "\(match.p1) vs. \(match.p2)"
        
        return cell
        }
    
    func victoryStatusDescription(_ match: RPSMatch ) -> String { //call String properties
        if ( match.p1 == match.p2 ) {
            return "Tie"
        } else if ( match.p1.defeats(match.p2) ) {
            return "Win"
        } else {
            return "Lose"
        }
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}

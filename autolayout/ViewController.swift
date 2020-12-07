//
//  ViewController.swift
//  autolayout
//
//  Created by AndUser on 11.11.2020.
//  Copyright © 2020 AndUser. All rights reserved.
//

import UIKit

let itemsArray2 = [("ПЯТНИЦА, 13 НОЯБ.", ""), ("[Andersen] Daily Meeting", "15:30"), ("[Andersen] Аудит", "16:00"), ("ВОСКРЕСЕНЬЕ, 15 НОЯБ.", ""), ("Turkish Grand Prix", "12:10"), ("ПОНЕДЕЛЬНИК, 16 НОЯБ.", ""), ("SA_Platform features (mob)_we...", "10:30"), ("ещё 1 событие", "")]

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemsArray2.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let item = itemsArray2[indexPath.row]
        cell.textLabel?.text = item.0
        cell.detailTextLabel?.text = item.1
        
        return cell
        
    }
}


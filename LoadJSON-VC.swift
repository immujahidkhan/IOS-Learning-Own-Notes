//
//  ViewController.swift
//  loadJsonFromLocal
//
//  Created by MujahidKhan on 13/10/2019.
//  Copyright © 2019 MujahidKhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{

    @IBOutlet weak var tableView : UITableView!
    var names = [Names]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.names = Bundle.main.decode(type: [Names].self, from: "fat.json")
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row].title
        return cell
    }
    
}

struct Names : Decodable{
    let title : String
}


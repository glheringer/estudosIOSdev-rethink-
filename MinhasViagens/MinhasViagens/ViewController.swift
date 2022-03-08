//
//  ViewController.swift
//  MinhasViagens
//
//  Created by Rethink on 04/03/22.
//

import UIKit

class ViewController: UITableViewController {
    var viagens: [String]  = ["Paris","Governador Valadares"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viagens.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let locaisViagens = viagens[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath)
        celula.textLabel?.text = locaisViagens
        return celula
    }
}


//
//  ViewController.swift
//  Salvar Dados
//
//  Created by Rethink on 23/02/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let games: [String] = ["Valorant","Dota 2", "World of Warcraft"]
        UserDefaults.standard.set(games, forKey: "recuperarGames")
        let retorno = UserDefaults.standard.object(forKey: "recuperarGames")
        print(retorno)
    }


}


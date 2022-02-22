//
//  ViewController.swift
//  MeusFilmes
//
//  Created by Rethink on 22/02/22.
//

import UIKit

class ViewController: UITableViewController {

    var filmes: [Filme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var filme : Filme
       
        var imagem = UIImage(named: "filme1")
        filme = Filme(titulo: "007 - Spectre", descricao: "Descricao 1", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme2")
        filme = Filme(titulo: "Star Wars", descricao: "Descricao 2", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme3")
        filme = Filme(titulo: "Impacto Mortal", descricao: "Descricao 3", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme4")
        filme = Filme(titulo: "Deadpool", descricao: "Descricao 4", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme5")
        filme = Filme(titulo: "O Regresso", descricao: "Descricao 5", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme6")
        filme = Filme(titulo: "A Herdeira", descricao: "Descricao 6", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme7")
        filme = Filme(titulo: "Caçadores de Emoção", descricao: "Descricao 7", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme8")
        filme = Filme(titulo: "Regresso do Mal", descricao: "Descricao 8", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme9")
        filme = Filme(titulo: "Tarzan", descricao: "Descricao 9", imagem: imagem!)
        filmes.append(filme)
        
        imagem = UIImage(named: "filme10")
        filme = Filme(titulo: "Hardcore", descricao: "Descricao 10", imagem: imagem!)
        filmes.append(filme)
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filmes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celulaReuso = "celulaReuso"
        let  filme = filmes [indexPath.row]
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! FilmeCelula
        celula.filmeImageView.image = filme.imagem
        celula.tituloLabel.text = filme.titulo
        celula.descricaoLabel.text = filme.descricao
        
        celula.filmeImageView.layer.cornerRadius = 42
        celula.filmeImageView.clipsToBounds = true
        
        return celula
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detalhesFilme"{
            if let indexPath = tableView.indexPathForSelectedRow{
                let filmeDestino = self.filmes[indexPath.row]
                let viewControllerDestino = segue.destination as! DetalheFilmes
                viewControllerDestino.filme = filmeDestino
            }
        }
    }
}


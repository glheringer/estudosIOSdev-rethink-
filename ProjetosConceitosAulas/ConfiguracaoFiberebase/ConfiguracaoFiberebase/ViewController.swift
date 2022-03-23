//
//  ViewController.swift
//  ConfiguracaoFiberebase
//
//  Created by Rethink on 22/03/22.
//

import UIKit
import Firebase
import FirebaseCore
import FirebaseDatabase
import FirebaseAuth

class ViewController: UIViewController {

    // Criar referencia ao banco de dados
    let firebase = Database.database().reference()
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            //Login
        Auth.auth().signIn(withEmail: "guilherme.heringer@gmail.con", password: "gui1234") { (user, erro ) in
            if erro == nil { //sucesso
                print("Sucesso ao logar" )
            }
            else{
                print("Erro ao logar: \(String(describing: erro?.localizedDescription))")
            }
        }
            
//            //Log out
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("Erro ao deslogar usuario!! ")
//        }
//
        // Testar se  o usuario está logado
        Auth.auth().addStateDidChangeListener { (FirAuth, user) in
            if let userLoggedIn = user {
                print ("O usuario de email \(String(describing: userLoggedIn.email)) está logado.")
            }
            else{
                print ("O usuario nao está logado.")
            }
        }
        
            /*Auth.auth().createUser(withEmail: "guilherme.heringer@gmail.con", password: "gui1234") { (user, erro ) in

            if erro == nil { //sucesso
                print("Sucesso ao cadastrar usuario" )
            }
            else{
                print("Erro ao cadastrar usuario: \(String(describing: erro?.localizedDescription))")
            }
        }
        
        // Testar se  o usuario está logado
        Auth.auth().addStateDidChangeListener { (FirAuth, user) in
            if let userLoggedIn = user {
                print ("O usuario de email \(String(describing: userLoggedIn.email)) está logado.")
            }
            else{
                print ("O usuario nao está logado.")
            }
        }*/
        
        
        /*
        //Cria um Nó abaixo da raiz do banco
        let pointer = firebase.child("score").child("value")
        
//        pointer.removeValue() //remover valor do banco, passado no metodo firebase.child("nó a ser removido")
        
//        pointer.child("value").setValue("10")
        
        //Recuperar dados do Banco
        pointer.observe(DataEventType.value) { (data) in //criando um ouvinte para determinado nó
            
            let recoverData = data.value as! String //data.value para recuperar valor
            self.textLabel.text = recoverData
        }
         */
        
    }


}


//
//  ViewController.swift
//  AlcoolOuGasolina
//
//  Created by Rethink on 14/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultadoLegenda: UILabel!
    @IBOutlet weak var precoAlcoolCampo: UITextField!
    @IBOutlet weak var precoGasolinaCampo: UITextField!
    @IBAction func calcularCombustivel(_ sender: Any) {
        //Validar se foi digitado algum valor
        if let precoAlcool = precoAlcoolCampo.text{
            if let precoGasolina = precoGasolinaCampo.text{
                //Validar valores digitados
                let validaCampos = self.validarCampos(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                if validaCampos{
                    //Calcular melhor combustivel
                    self.calcularMelhorPreco(precoAlcool: precoAlcool, precoGasolina: precoGasolina)
                }
                else{
                    resultadoLegenda.text = "Digite os preços para calcular!"
                }
            }
        }
    }
    func calcularMelhorPreco(precoAlcool:String, precoGasolina:String){
        //Converte valores string para numeros
        if let valorAlcool = Double(precoAlcool){
            if let valorGasolina = Double(precoGasolina){
            /*  Calculo feito (precoAlcool / precoGasolina)
                Se resultado >= 0.7 melhor usar gasolina
                senao melhor usar alcool
            */
                let resultadoCalc = valorAlcool / valorGasolina
                if (resultadoCalc >= 0.7){
                    self.resultadoLegenda.text = "É melhor utilizar Gasolina!!"
                }
                else{
                    self.resultadoLegenda.text = "É melhor utilizar Alcool!!"
                }
            }
        }
       
    }
    
    func validarCampos (precoAlcool:String, precoGasolina:String) -> Bool{
        var camposValidados = true
        if (precoAlcool.isEmpty || precoGasolina.isEmpty){
             camposValidados = false
            
        }
        return camposValidados
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }


}


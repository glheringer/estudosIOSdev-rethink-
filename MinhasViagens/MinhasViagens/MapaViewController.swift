//
//  MapaViewController.swift
//  MinhasViagens
//
//  Created by Rethink on 04/03/22.
//
import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    
    let gerenciadorLocalizacao = CLLocationManager()
    var viagem: Dictionary<String,String> = [:]
    var indiceSelecionado: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indice = indiceSelecionado {
            if indice == -1 {
                //adicionar
                configurarGerenciadorLocalizacao()
            }
            else{
                //listar
                self.exibirAnotacao(viagem: viagem)
            }
        }
      
        
        //reconhecedor de Gestos
        let reconhecedorGesto = UILongPressGestureRecognizer(target: self, action: #selector(MapaViewController.marcarMapa (gesto:)))
        reconhecedorGesto.minimumPressDuration = 2
        
        mapa.addGestureRecognizer(reconhecedorGesto)
    }
    func exibirLocal( latitude: Double, longitude: Double ){
        
        //exibe local
        let localizacao = CLLocationCoordinate2DMake(latitude, longitude)
        let span = MKCoordinateSpan.init(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: span)
        self.mapa.setRegion(regiao, animated: true)
        
    }
    func exibirAnotacao(viagem: Dictionary<String,String> ){
        if let localViagem = viagem["local"] {
            if let latitudeS = viagem["latitude"] {
                if let longitudeS = viagem["longitude"] {
                    if let latitude = Double(latitudeS) {
                        if let longitude = Double(longitudeS) {
                            
                            //Adiciona anotacao
                            let anotacao = MKPointAnnotation()
                            
                            anotacao.coordinate.latitude = latitude
                            anotacao.coordinate.longitude = longitude
                            anotacao.title = localViagem
                            
                            self.mapa.addAnnotation(anotacao)
                            
                            exibirLocal(latitude: latitude, longitude: longitude)
                            
                        }
                    }
                }
            }
        }
    }
    
    @objc func marcarMapa (gesto: UIGestureRecognizer){
        
        if gesto.state == UIGestureRecognizer.State.began{
            //Recuperar Coordenadas de onde clicou
            let pontoSelecionado = gesto.location(in:self.mapa)
            let coordenadas = mapa.convert(pontoSelecionado, toCoordinateFrom: self.mapa)
            
           //recuperar  o endereco do ponto selecionado
            var localCompleto: String = "Endereco nao encontrado"
            let localizacao = CLLocation(latitude: coordenadas.latitude, longitude: coordenadas.longitude)
            
            CLGeocoder().reverseGeocodeLocation(localizacao) { (detalhesLocal, erro)in
                if erro == nil{
                    if  let dadosLocal = detalhesLocal?.first {
                        if let nome = dadosLocal.name{
                            localCompleto = nome
                        }
                        else{
                            if let endereco = dadosLocal.thoroughfare{
                               localCompleto = endereco
                            }
                        }
                    }
                    // Recuperar informacoes do local marcado / Salvar dados no dispositivo
                    self.viagem = ["local": localCompleto , "latitude": String(coordenadas.latitude) , "longitude": String(coordenadas.longitude) ]
                    ArmazenamentoDados().salvarViagem( viagem: self.viagem )
                    
                    //Exibe anotação com os dados de endereco
                    self.exibirAnotacao(viagem: self.viagem )
                }
                else{
                    print("erro")
                }
            }
        }
    }
    func configurarGerenciadorLocalizacao () {
        gerenciadorLocalizacao.delegate = self
        gerenciadorLocalizacao.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocalizacao.requestWhenInUseAuthorization()
        gerenciadorLocalizacao.startUpdatingLocation()
    }
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        let status = manager.authorizationStatus
        
        if status != .authorizedWhenInUse && status != .authorizedAlways{
            let alertaController = UIAlertController(title: "Permissao para localizacao", message: "Necessario o acesso à localizacao durante o uso do app", preferredStyle: .alert)
            let acaoCancelar  = UIAlertAction(title: "Cancelar", style: .destructive, handler: nil)
          
            let acaoConfiguracoes = UIAlertAction(title: "Acessar Configuracoes", style: .default) { acaoConfiguracoes in
                if let configurar = NSURL(string: UIApplication.openSettingsURLString){
                    UIApplication.shared.open(configurar as URL)
                }
            }
            alertaController.addAction(acaoConfiguracoes)
            alertaController.addAction(acaoCancelar)
            present(alertaController, animated: true, completion: nil)
        }
    }

}

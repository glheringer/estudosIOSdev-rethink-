//
//  ViewController.swift
//  TrabalhandoComMapas
//
//  Created by Rethink on 25/02/22.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate{

    @IBOutlet weak var mapa: MKMapView!
    var gerenciadorLocal = CLLocationManager ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gerenciadorLocal.delegate = self
        gerenciadorLocal.desiredAccuracy = kCLLocationAccuracyBest
        gerenciadorLocal.requestWhenInUseAuthorization()
        gerenciadorLocal.startUpdatingLocation()
        
//        Parque Ipanema
//        let latitude : CLLocationDegrees = -19.46943071229893
//        let longitude : CLLocationDegrees = -42.5427812557696
//
//
//        let latitudeDelta: CLLocationDegrees = 0.01
//        let longitudeDelta : CLLocationDegrees = 0.01
//
//        let localizacao : CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
//        let areaVisualizacacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
//        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacacao)
//
//        let anotacao = MKPointAnnotation()
//        anotacao.coordinate = localizacao
//        anotacao.title = "Parque Ipanema"
//        anotacao.subtitle = "Parque de lazer situado em Ipatinga"
//
//        mapa.setRegion(regiao, animated: true)
//        mapa.addAnnotation(anotacao)
        }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let localizacaoUsuario: CLLocation = locations.last!
        
//        Monta a exibicao do mapa, para ele mudar a posicao no mapa de acordo com a localização do usuário
        let latitude : CLLocationDegrees = localizacaoUsuario.coordinate.latitude
        let longitude : CLLocationDegrees = localizacaoUsuario.coordinate.longitude
 
 
        let latitudeDelta: CLLocationDegrees = 0.01
        let longitudeDelta : CLLocationDegrees = 0.01
 
        let localizacao : CLLocationCoordinate2D = CLLocationCoordinate2D.init(latitude: latitude, longitude: longitude)
        let areaVisualizacacao: MKCoordinateSpan = MKCoordinateSpan.init(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let regiao: MKCoordinateRegion = MKCoordinateRegion.init(center: localizacao, span: areaVisualizacacao)
      
        mapa.setRegion(regiao, animated: true)
    }

}




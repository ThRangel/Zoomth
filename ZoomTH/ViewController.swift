//
//  ViewController.swift
//  ZoomTH
//
//  Created by MacBook Air  on 28/12/19.
//  Copyright © 2019 MacBook Air . All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var miScroll: UIScrollView!
    @IBOutlet weak var miImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.miScroll.minimumZoomScale = 1
        self.miScroll.maximumZoomScale = 4
        
        miScroll.delegate = self
    }//del override


}//del view controller
extension ViewController : UIScrollViewDelegate{
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return miImageView
    }// del la func viewForZooming
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if miScroll.zoomScale > 1{
            if let imagen = miImageView.image{//segundo if
                let radioAncho = miImageView.frame.width / imagen.size.width
                let radioLargo = miImageView.frame.height / imagen.size.height
                
                let radio = radioAncho < radioLargo ? radioAncho : radioLargo
                let nuevaAnchura = imagen.size.width * radio
                let nuevoLargo = imagen.size.height * radio
                
                let conditionLeft = nuevaAnchura*miScroll.zoomScale>miImageView.frame.width
                let left = 0.5 * (conditionLeft ? nuevaAnchura - miImageView.frame.width : (miScroll.frame.width - miScroll.contentSize.width) )
                
                let condicionArriba = nuevoLargo*miScroll.zoomScale > miImageView.frame.height
                let arriba = 0.5 * (condicionArriba  ? nuevoLargo - miImageView.frame.height : (miScroll.frame.height - miScroll.contentSize.height) )
                miScroll.contentInset = UIEdgeInsets(top: arriba, left: left, bottom: arriba, right: left)
                
            }//del segundo if
            else{
                miScroll.contentInset = .zero
            }
        }//del primer if
    }//de la funcion scrollViewDidZoom
    
    
}//del extension


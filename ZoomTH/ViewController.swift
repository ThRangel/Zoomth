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
}//del extension


//
//  ViewController.swift
//  UdenyColores
//
//  Created by Bear on 23/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgKnobBase: UIImageView!
    @IBOutlet weak var imgKnob: UIImageView!
    @IBOutlet weak var btnSwicht: UIButton!
    
    private var deltaAngle: CGFloat?
    private var  startTransform: CGAffineTransform?
    
    //El punto de arriba
    private var setPointAngle = M_PI_2
    
    //Establecemos nuestros limites tomando como referencia un angulo de 30 grados
    private var maxAngle =  7 * M_PI / 6
    private var minAngle = 0 - (M_PI / 6)
    
    override var prefersStatusBarHidden: Bool{// BORRA LA PARTE DE ARRIBA DE LA PANTALLA, DONDE APARECE LA BATERIA CARGANDO
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imgKnob.isHidden = true
        imgKnobBase.isHidden = true
        imgKnob.isUserInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        btnSwicht.setImage(#imageLiteral(resourceName: "img_switch_off"), for: .normal)
        btnSwicht.setImage(UIImage(named: "img_switch_on"), for: .selected)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }

    @IBAction func clicSwitch(_ sender: UIButton) {
        btnSwicht.isSelected = !btnSwicht.isSelected
        if btnSwicht.isSelected{
            imgKnobBase.isHidden = false
            imgKnob.isHidden = false
            view.backgroundColor = UIColor(hue: 0.5, saturation: 0.5, brightness: 0.75, alpha: 1.0)
        }else{
            view.backgroundColor = UIColor(hue: 0.5, saturation: 0, brightness: 0.2, alpha: 1.0)
            imgKnob.isHidden = true
            imgKnobBase.isHidden = true
        }
    }
    
    func resetKnob(){
        view.backgroundColor = UIColor(hue: 0.5, saturation: 0.5, brightness: 0.75,alpha:1.0)
        imgKnob.transform = CGAffineTransform.identity
        setPointAngle = M_PI_2
    }
    
    private func touchIsInKnobWithDistance(distance: CGFloat) -> Bool{
        if distance > (imgKnob.bounds.height / 2){//Estamos calculando el radio
            return false
        }
        return true
    }
    
    private func CalculateDistanceFromCenter(_ point: CGPoint) -> CGFloat{
        let center = CGPoint(x: imgKnob.bounds.size.width / 2.0, y: imgKnob.bounds.size.height / 2.0)
        let dx = point.x - center.x
        let dy = point.y - center.y
        return sqrt((dx * dy) + (dx*dy))
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent? ){
        if let touch  = touches.first{
            let delta = touch.location(in: imgKnob)
            let dist = CalculateDistanceFromCenter(delta)
            if touchIsInKnobWithDistance(distance: dist){
                startTransform = imgKnob, startTransform
                let center = CGPoint(x: imgKnob.bounds.size / 2, y: imgKnob.bounds.size.height / 2.0)
                let 
            }
        }
    }
}


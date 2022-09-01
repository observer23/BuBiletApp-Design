//
//  DetayVC.swift
//  buBiletApp
//
//  Created by Ekin Atasoy on 1.09.2022.
//

import UIKit

class DetayVC: UIViewController {


    @IBOutlet weak var konserResimImage: UIImageView!
    
    @IBOutlet weak var konserAdıLabel: UILabel!
 
    @IBOutlet weak var mekanLabel: UILabel!
    
    @IBOutlet weak var tarihLabel: UILabel!
    
    @IBOutlet weak var fiyatLabel: UILabel!
    var konser :Konserler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k=konser{
            konserAdıLabel.text = k.konser_adi
            tarihLabel.text = k.konserTarih
            mekanLabel.text = k.konser_id
            konserResimImage.image  = UIImage(named: k.konserResimAdi!)
            fiyatLabel.text = "\(k.biletFiyat!)₺"
            
        }
        
    }

    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let k=konser{
            print("\(k.konser_adi!) \(k.biletFiyat!) fiyatı ile sepete eklendi! ")
        }
    }
    
}


//
//  KonserlerCollectionView.swift
//  buBiletApp
//
//  Created by Ekin Atasoy on 1.09.2022.
//

import UIKit

protocol HucreProtokol{
    func buttonTiklandi(indexPath:IndexPath)
}

class KonserlerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var konserResimImage: UIImageView!
    @IBOutlet weak var konserAdLabel: UILabel!
    
    @IBOutlet weak var alısveriSepetiImage: UIImageView!
    @IBOutlet weak var mekanImage: UIImageView!
    @IBOutlet weak var tarihImage: UIImageView!
    var hucreProtokol: HucreProtokol?
    var indexPath : IndexPath?

    @IBOutlet weak var buttonSepetLabel: UIButton!
    @IBOutlet weak var konserMekanLabel: UILabel!
    @IBOutlet weak var konserTarihLabel: UILabel!
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        hucreProtokol?.buttonTiklandi(indexPath: indexPath!)
    }
}

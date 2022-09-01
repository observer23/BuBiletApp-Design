//
//  ViewController.swift
//  DetayliCollectionViewKullanimi
//
//  Created by Ekin Atasoy on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var KonserlerListesi=[Konserler]()

    @IBOutlet weak var naviLogo: UINavigationItem!
    @IBOutlet weak var KonserlerCollectionView: UICollectionView!
    
    
    @IBOutlet weak var buttonSepetLabel: UIButton!
    @IBOutlet weak var logoBubilet: UIImageView!
    @IBOutlet weak var searchBarItem: UISearchBar!
    @IBOutlet weak var kayanResim: UIImageView!
    
    @IBOutlet weak var alısverisSepetiImage: UIImageView!
    
    @IBOutlet weak var sehirLabel: UILabel!
    @IBOutlet weak var filtrelemeMockUp: UIImageView!
    @IBOutlet weak var tabBArImgaeView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        searchBarItem.searchTextField.layer.cornerRadius = 20
        searchBarItem.searchTextField.layer.masksToBounds = true
        
        

        kayanResim.image = UIImage(named: "kayanResim.jpg")
        tabBArImgaeView.image = UIImage(named: "tabBarMockupImage.jpg")
        
        
        
        let k1=Konserler(konser_id: "Kültürpark Açık Hava Tiyatrosu", konser_adi: "Yıldız Tilbe Konseri", konserResimAdi: "yildiztilbe_resim", konserTarih: "26 Ekim Çar - 22.30", biletFiyat: 449.00)
        let k2=Konserler(konser_id: "SoldOut Mavişehir", konser_adi: "Gökhan Türkmen Konseri", konserResimAdi: "gokhanturkmen_resim", konserTarih: "02 Eylül,03 Ekim", biletFiyat: 75.00)
        let k3=Konserler(konser_id: "SoldOut Mavişehir", konser_adi: "Göksel Konseri", konserResimAdi: "goksel_resim", konserTarih: "14 Eylül,22 Ekim", biletFiyat: 99.00)
        let k4=Konserler(konser_id: "İzmir Arena", konser_adi: "Yüzyüzeyken Konuşuruz Konseri", konserResimAdi: "yuzyuzeykenKonusuruz_resim", konserTarih: "04 Eylül Paz - 21.00", biletFiyat: 160.00)
        let k5=Konserler(konser_id: "Ooze Venue", konser_adi: "Mor ve Ötesi Konseri", konserResimAdi: "morveotesi_resim", konserTarih: "10 Eylül Cmt - 22.30", biletFiyat: 336.00)
        let k6=Konserler(konser_id: "İzmir Arena", konser_adi: "LP Konseri", konserResimAdi: "lp_resim", konserTarih: "26 Eylül Pzt - 17.00", biletFiyat: 499.00)
        KonserlerListesi.append(k1)
        KonserlerListesi.append(k2)
        KonserlerListesi.append(k3)
        KonserlerListesi.append(k4)
        KonserlerListesi.append(k5)
        KonserlerListesi.append(k6)
        
        
        let tasarim=UICollectionViewFlowLayout()
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        let genislik = KonserlerCollectionView.frame.size.width
        let itemGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.7)
        KonserlerCollectionView.collectionViewLayout = tasarim
        
        KonserlerCollectionView.delegate = self
        KonserlerCollectionView.dataSource = self
    }

    @IBAction func buttonFiltreKonser(_ sender: Any) {
    }
    
    @IBAction func buttonFiltreTiyatro(_ sender: Any) {
    }
    @IBAction func buttonFiltreFestival(_ sender: Any) {
    }
    
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource,HucreProtokol{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return KonserlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let konser = KonserlerListesi[indexPath.row]
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "filmHucre", for: indexPath) as! KonserlerCollectionViewCell
        
        cell.konserResimImage.image = UIImage(named: konser.konserResimAdi!)
        cell.konserAdLabel.text = konser.konser_adi
        cell.konserMekanLabel.text = konser.konser_id
        cell.konserTarihLabel.text = konser.konserTarih
        
        
        cell.mekanImage.image = UIImage(named: "mekanResim.jpg")
        cell.tarihImage.image = UIImage(named: "tarihResim.jpg")
        
        cell.alısveriSepetiImage.image = UIImage(named: "alisverisSepeti")

        cell.buttonSepetLabel.setTitle("\(konser.biletFiyat!) ₺", for: .normal)
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 25
        
        cell.hucreProtokol = self
        cell.indexPath  = indexPath
        

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = KonserlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let k=sender as? Konserler{
                let gidilecekVC=segue.destination as! DetayVC
                gidilecekVC.konser = k
            }
        }
            
    }
    
    func buttonTiklandi(indexPath: IndexPath) {
        let konser = KonserlerListesi[indexPath.row]
        print("Button:\(konser.konser_adi!) sepete eklendi.")
    }
}

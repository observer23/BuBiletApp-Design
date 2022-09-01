//
//  Konserler.swift
//  buBiletApp
//
//  Created by Ekin Atasoy on 1.09.2022.
//

import Foundation

import Foundation

class Konserler{
    init(konser_id: String?, konser_adi: String?, konserResimAdi: String?, konserTarih: String?, biletFiyat: Double?) {
        self.konser_id = konser_id
        self.konser_adi = konser_adi
        self.konserResimAdi = konserResimAdi
        self.konserTarih = konserTarih
        self.biletFiyat = biletFiyat
    }
    

    
    var konser_id:String?
    var konser_adi:String?
    var konserResimAdi:String?
    var konserTarih:String?
    var biletFiyat:Double?
    
}

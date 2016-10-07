//
//  Data.swift
//  Photos
//
//  Created by luc Casimir on 06/10/2016.
//  Copyright © 2016 Piscine_Swift_42. All rights reserved.
//

import Foundation

enum Data : String {
    case img800x600 = "http://wallpapershome.com/images/pages/pic_h/6470.jpg"
    case img2560x1600 = "https://wallpaperscraft.com/image/space_flight_sky_shadow_82966_2560x1600.jpg"
    case img1600x900 = "http://apod.nasa.gov/apod/image/1610/m33_brc_lrgb_ha_hiresPivato.jpg"
    case big = "http://sedonakarma.com/images/wallpapers/wallpaper-ultra-hd-8k/wallpaper-ultra-hd-8k-2.jpg"
    case four = "https://www.nasa.gov/sites/default/files/thumbnails/image/steenstrup.jpeg"
    static let allData : [Data] = [
        img800x600,
        img2560x1600,
        img1600x900,
        four,
        big,
    ]
}
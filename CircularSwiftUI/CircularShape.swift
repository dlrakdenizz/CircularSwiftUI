//
//  CircularShape.swift
//  CircularSwiftUI
//
//  Created by Dilara Akdeniz on 26.07.2023.
//

import SwiftUI
import Foundation

struct CircularShape: Shape {
    
    var percent : Double
    var startAngle : Double
    
    //Animasyon için gerekli olan kod.
    typealias AnimatableData = Double //Percentage göre işlem yaptığımız için Doule kullandık
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    //Görünüm ilk açıldığında nasıl görüneceğini yazdık
    init(percent : Double = 100, startAngle : Double = -90) {
        self.percent = percent
        self.startAngle = startAngle
        
    }
   
    //Path 2 boyutlu bir şeklin sınırlarını gösteren bir outline döndürür.
    func path(in rect: CGRect) -> Path {
        
        let width = rect.width
        let height = rect.height
        let radius = min(width, height) / 2 //Eğer tam bir daire değil de elipse benzeyen biraz daha basik bir şekil çizilirse kenara en yakın olan kısım yarıçap olur. Dolayısıyla min yaptık.
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = (self.percent / 100 * 360) + self.startAngle
        
        //addArc kısmı ile şeklin merkezi, yarıçapı ne olsun, nerede başlayıp nerede bitsin, saat yönüne mi tersine mi doğru çizilsin bu kısımlar belirtilir.
        return Path { path in
            path.addArc(center: center, radius: radius, startAngle: Angle(degrees: startAngle), endAngle: Angle(degrees: endAngle), clockwise: false)
            
        }
    }
    
}


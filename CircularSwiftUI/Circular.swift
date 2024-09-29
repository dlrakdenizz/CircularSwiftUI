//
//  Circular.swift
//  CircularSwiftUI
//
//  Created by Dilara Akdeniz on 26.07.2023.
//


/*
 GeometryReader, SwiftUI'da bir kapsayıcı görünüm (container view) olarak kullanılır ve alt görünümlerine (child views) bulunduğu ortamın boyutları ve konumu hakkında bilgi sağlar. Yani, bir görünümün ekran üzerindeki boyutları ve koordinatları gibi bilgileri almanızı ve buna göre görsel öğelerin düzenlenmesini sağlar.
 
 GeometryReader Ne Zaman Kullanılır?
 Responsive Tasarımlar: Farklı ekran boyutlarına ve yönlerine göre esnek bir tasarım oluşturmak gerektiğinde kullanılır.
 Dinamik Düzenler: Bir görünümün ekranın belirli bir kısmına yerleştirilmesi veya boyutlarının ekrana göre dinamik olarak ayarlanması gerektiğinde.
 Animasyonlar ve Geçişler: Görünümün boyut ve konumuna dayalı animasyonlar oluşturmak için kullanılır.
 */


import SwiftUI

struct Circular: View {
    
    let lineWidth : CGFloat
    let backgroundColor : Color
    let foregroundColor : Color
    let percentage : Double
    
    var body: some View {
        
        GeometryReader { geometry in
            ZStack {
                CircularShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth)) //kalınlık belirlendi
                    .fill(backgroundColor)
                
                CircularShape(percent: percentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(foregroundColor)
            }
            .animation(.easeIn(duration: 1.0), value: percentage)//value animasyonun neye göre değişeceğini söylediğimiz kısımdır. İlk kısımda da animasyonu seçiyoruz.
            .padding(lineWidth/1.5)
        }
        
       
    }
}

struct Circular_Previews: PreviewProvider {
    static var previews: some View {
        Circular(lineWidth: 10, backgroundColor: .red, foregroundColor: .green, percentage: 50)
    }
}

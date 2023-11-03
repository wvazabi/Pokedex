//
//  PokeAvatarImage.swift
//  PokedexSearch
//
//  Created by Enes Kaya on 3.11.2023.
//

import Foundation
import UIKit

class GFAvatarImageView: UIImageView {
    private enum ViewMetrics {
        static let cornerRadius: CGFloat = 10.0
    }
    
    
    var placeholderImage = UIImage(named: "poke")!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius = 10
        clipsToBounds = true
        image          = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = ViewMetrics.cornerRadius
        
    }
    
    
   
}

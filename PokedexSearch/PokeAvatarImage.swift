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
    
    
    var placeholderImage = UIImage(named: "placeholder")!
   
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
    
    
    func downloadImage(from urlString: String) {
        
     
        
        guard let url = URL(string: urlString) else { return }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {return}
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            guard let data = data else { return }
            
            guard let image = UIImage(data: data) else { return }
        
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        
        task.resume()
    }
}

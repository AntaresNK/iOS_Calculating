//
//  Constraints.swift
//  iOS_Calculating
//
//  Created by Nazym Sayakhmet on 13.09.2023.
//

import Foundation
import UIKit

extension UIButton {
    
    func configureButton() {
        
        self.titleLabel?.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        self.layer.cornerRadius = 40
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 80),
            self.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
}

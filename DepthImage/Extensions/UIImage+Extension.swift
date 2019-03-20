//
//  UIImage+Extension.swift
//  DepthImage
//
//  Created by Mobdev125 on 3/20/19.
//  Copyright © 2019 Mobdev125. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init?(ciImage: CIImage?) {
        
        guard let ciImage = ciImage else {
            return nil
        }
        
        self.init(ciImage: ciImage)
    }
}


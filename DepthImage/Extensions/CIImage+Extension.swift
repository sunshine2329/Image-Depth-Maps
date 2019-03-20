//
//  CIImage+Extension.swift
//  DepthImage
//
//  Created by Mobdev125 on 3/20/19.
//  Copyright © 2019 Mobdev125. All rights reserved.
//

import UIKit

extension CIImage {
    
    convenience init?(image: UIImage?) {
        
        guard let image = image else {
            return nil
        }
        
        self.init(image: image)
    }
    
    convenience init?(cvPixelBuffer: CVPixelBuffer?) {
        
        guard let cvPixelBuffer = cvPixelBuffer else {
            return nil
        }
        
        self.init(cvPixelBuffer: cvPixelBuffer)
    }
    
    convenience init?(cgImage: CGImage?) {
        
        guard let cgImage = cgImage else {
            return nil
        }
        
        self.init(cgImage: cgImage)
    }
}

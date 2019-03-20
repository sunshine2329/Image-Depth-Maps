//
//  DepthImageFilters.swift
//  DepthImage
//
//  Created by Mobdev125 on 3/20/19.
//  Copyright © 2019 Mobdev125. All rights reserved.
//

import UIKit

enum MaskParams {
    static let slope: CGFloat = 4.0
    static let width: CGFloat = 0.1
}

class DepthImageFilters {
    
    var context: CIContext
    
    init(context: CIContext) {
        self.context = context
    }
    
    init() {
        context = CIContext()
    }
    
    func createMask(for depthImage: CIImage, withFocus focus: CGFloat, andScale scale: CGFloat) -> CIImage {
        return depthImage
    }
}



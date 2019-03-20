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
        let s1 = MaskParams.slope
        let s2 = -MaskParams.slope
        let filterWidth =  2 / MaskParams.slope + MaskParams.width
        let b1 = -s1 * (focus - filterWidth / 2)
        let b2 = -s2 * (focus + filterWidth / 2)
        
        let mask0 = depthImage
            .applyingFilter("CIColorMatrix", parameters: [
                "inputRVector": CIVector(x: s1, y: 0, z: 0, w: 0),
                "inputGVector": CIVector(x: 0, y: s1, z: 0, w: 0),
                "inputBVector": CIVector(x: 0, y: 0, z: s1, w: 0),
                "inputBiasVector": CIVector(x: b1, y: b1, z: b1, w: 0)])
            .applyingFilter("CIColorClamp")
        
        let mask1 = depthImage
            .applyingFilter("CIColorMatrix", parameters: [
                "inputRVector": CIVector(x: s2, y: 0, z: 0, w: 0),
                "inputGVector": CIVector(x: 0, y: s2, z: 0, w: 0),
                "inputBVector": CIVector(x: 0, y: 0, z: s2, w: 0),
                "inputBiasVector": CIVector(x: b2, y: b2, z: b2, w: 0)])
            .applyingFilter("CIColorClamp")

        let combinedMask = mask0.applyingFilter("CIDarkenBlendMode", parameters: ["inputBackgroundImage" : mask1])
        
        let mask = combinedMask.applyingFilter("CIBicubicScaleTransform", parameters: ["inputScale": scale])
        
        return mask
    }
    
    func spotlightHighlight(image: CIImage, mask: CIImage, orientation: UIImage.Orientation = .up) -> UIImage? {
        let output = image.applyingFilter("CIBlendWithMask", parameters: ["inputMaskImage": mask])
        guard let cgImage = context.createCGImage(output, from: output.extent) else {
            return nil
        }
        return UIImage(cgImage: cgImage, scale: 1.0, orientation: orientation)
    }

}



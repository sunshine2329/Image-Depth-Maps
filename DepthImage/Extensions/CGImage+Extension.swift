//
//  CGImage+Extension.swift
//  DepthImage
//
//  Created by Mobdev125 on 3/20/19.
//  Copyright © 2019 Mobdev125. All rights reserved.
//

import CoreVideo
import CoreGraphics

extension CGImage {
    
    func pixelBuffer() -> CVPixelBuffer? {
        
        var pxbuffer: CVPixelBuffer?
        
        guard let dataProvider = dataProvider else {
            return nil
        }
        
        let dataFromImageDataProvider = CFDataCreateMutableCopy(kCFAllocatorDefault, 0, dataProvider.data)
        
        CVPixelBufferCreateWithBytes(
            kCFAllocatorDefault,
            width,
            height,
            kCVPixelFormatType_32ARGB,
            CFDataGetMutableBytePtr(dataFromImageDataProvider),
            bytesPerRow,
            nil,
            nil,
            nil,
            &pxbuffer
        )
        
        return pxbuffer
    }
}

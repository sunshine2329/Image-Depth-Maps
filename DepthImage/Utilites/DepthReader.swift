//
//  DepthReader.swift
//  DepthImage
//
//  Created by Mobdev125 on 3/20/19.
//  Copyright © 2019 Mobdev125. All rights reserved.
//

#if !IOS_SIMULATOR
import AVFoundation

struct DepthReader {
    
    var name: String
    var ext: String
    
    func depthDataMap() -> CVPixelBuffer? {
        
        guard let fileURL = Bundle.main.url(forResource: name, withExtension: ext) as CFURL? else {
            return nil
        }
        guard let source = CGImageSourceCreateWithURL(fileURL, nil) else {
            return nil
        }
        
        guard let auxDataInfo = CGImageSourceCopyAuxiliaryDataInfoAtIndex(source, 0,
                                                                          kCGImageAuxiliaryDataTypeDisparity) as? [AnyHashable : Any] else {                                                                    return nil
        }
        
        var depthData: AVDepthData
        do {
            depthData = try AVDepthData(fromDictionaryRepresentation: auxDataInfo)
        } catch {
            return nil
        }
        
        if depthData.depthDataType != kCVPixelFormatType_DisparityFloat32 {
            depthData = depthData.converting(toDepthDataType: kCVPixelFormatType_DisparityFloat32)
        }
        
        return depthData.depthDataMap
    }
}
#endif


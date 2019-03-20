//
//  ControlEnums.swift
//  DepthImage
//
//  Created by Mobdev125 on 3/20/19.
//  Copyright © 2019 Mobdev125. All rights reserved.
//

enum ImageMode: Int {
    case original = 0
    case depth = 1
    case mask = 2
    case filtered = 3
}

enum FilterType: Int {
    case spotlight = 0
    case color = 1
    case blur = 2
}

//
//  Image.swift
//  SwiftMagickWand
//
//  Created by Yusuke Ito on 3/7/16.
//  Copyright © 2016 Yusuke Ito. All rights reserved.
//

import MagickWand

public class Wand {
    
    public typealias BufferType = UInt8
    
    public static func genesis() {
        MagickWandGenesis()
    }
    
    let wand: COpaquePointer
    
    init() {
        wand = NewMagickWand()
    }
    public convenience init(imageBytes: [BufferType]) {
        self.init()
        MagickReadImageBlob(wand, imageBytes, imageBytes.count)
    }
    
    public func resize(w: Int, h: Int) {
        MagickResizeImage(wand, w, h, LanczosFilter, 1.0)
    }
    
    public func getImageBytes() -> [BufferType] {
        var size: Int = 0
        let mem = MagickWriteImageBlob(wand, &size) // TODO
        var outBuf = Array<BufferType>.init(count: size, repeatedValue: 0)
        for i in 0..<size {
            outBuf[i] = mem[i]
        }
        // TODO: free memory
        return outBuf
    }
    
    // TODO: deinit
}
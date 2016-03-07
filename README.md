# SwiftMagickWand

MagickWand(ImageMagick) wrapper for Swift


## Sample
```swift

import SwiftMagickWand

Wand.genesis()

// https://en.wikipedia.org/wiki/Pikachu
let inputImage = NSData(contentsOfFile: "025Pikachu.png")!

let inputBytes = Array(UnsafeBufferPointer(start: UnsafePointer<UInt8>(inputImage.bytes), count: inputImage.length))

let wand = Wand(imageBytes: inputBytes)

wand.resize(80, h: 80)

let out = wand.getImageBytes()

let outData = NSData(bytes: out, length: out.count)

outData.writeToFile("/tmp/pikachu_resized.png", atomically: false)


```
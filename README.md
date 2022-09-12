# CustomShaderWithMetalPetal

This repo shows how to process a stream of images with [MetalPetal](https://github.com/MetalPetal/MetalPetal) framework, 
using custom shaders (vertex and fragment).

>Most of the files in this repo are self-explanatory.
There are also additional comments within the individual files which should hopefully help.

## Main features
1. Use of [MTIGeometry](https://github.com/MetalPetal/MetalPetal/blob/master/Frameworks/MetalPetal/MTIGeometry.h) protocol. (See [DistortionGeometry](https://github.com/gaboyeji/CustomShaderWithMetalPetal/blob/main/CustomShaderWithMetalPetal/Components/Filters/Distort/DistortFilter/DistortFilter.swift#L19) *Line: 19*)

```swift
struct DistortionGeometry {
    
    let points: MTIGeometry
    
    init(width: Int, height: Int, cellSize: Int) {
        let size = SIMD2<Float>(Float(width), Float(height))
        let hMeshCount = (width + cellSize - 1) / cellSize
        let vMeshCount = (height + cellSize - 1) / cellSize
        
        // Create vertices
        var vertices = [MTIVertex]()
        for r in 0...vMeshCount {
            for c in 0...hMeshCount {
                let currentPosition = SIMD2<Float>(Float(c * cellSize), Float(r * cellSize))
                let targetPosition: SIMD2<Float> = (currentPosition)/size
                vertices.append(MTIVertex(position: SIMD4<Float>(x: (targetPosition.x - 0.5) * 2, y: ((1 - targetPosition.y) - 0.5) * 2, z: 0, w: 1),
                                          textureCoordinate: currentPosition/size))
            }
        }
        
        // Create indices
        var indices: [UInt32] = []
        for r in 1...vMeshCount {
            for c in 1...hMeshCount {
                let i = r * (hMeshCount + 1) + c
                let t = (r - 1) * (hMeshCount + 1) + c
                let tl = (r - 1) * (hMeshCount + 1) + c - 1
                let l = i - 1
                let t1: [UInt32] = [UInt32(i), UInt32(t), UInt32(tl)]
                let t2: [UInt32] = [UInt32(i), UInt32(l), UInt32(tl)]
                indices.append(contentsOf: t1)
                indices.append(contentsOf: t2)
            }
        }
        
        self.points = MTIVertices(vertexBuffer: MTIDataBuffer(mtiVertices: vertices)!,
                                vertexCount: UInt(vertices.count),
                                indexBuffer: MTIDataBuffer(uint32Indexes: indices)!,
                                indexCount: UInt(indices.count),
                                primitiveType: .triangle)
    }
}
```

2. Distortion Model declaration. (See [DistortionParameters](https://github.com/gaboyeji/CustomShaderWithMetalPetal/blob/main/CustomShaderWithMetalPetal/Components/Filters/Distort/DistortFilter/DistortFilter.swift#L9)  *Line: 9*)

```swift
struct DistortionParameters {
    var point: SIMD2<Float> = .zero
    var radius: Float = 0
    var direction: Float = 0
    var strength: Float = 0
    var density: Float = 0
    var width: Float = 0
    var height: Float = 0
}
```

3. Subclassing with [MTIUnaryFilter](https://github.com/MetalPetal/MetalPetal/blob/master/Frameworks/MetalPetal/Filters/MTIFilter.h). (See [GADistortFilter](https://github.com/gaboyeji/CustomShaderWithMetalPetal/blob/main/CustomShaderWithMetalPetal/Components/Filters/Distort/DistortFilter/DistortFilter.swift#L63) *Line: 63*) 

```swift
class GADistortFilter: NSObject, MTIUnaryFilter { ... }
```

4. Bonus:
    * Camera and CameraManager class
    * Console debugger
    * Controller mode observable


## Word of caution ‼️

- This is not the `prefered` way of using the MetalPetal framework in your project.
    - I.e. use the suggested `dependency package manager` (CocoaPods or Swift Package Manager)

- We use it this way because some additions were made to some files for our own use.



## Test it out ✅
  1. Download this repo 
  2. Set Team signing
  3. Connect physical device
  4. Enjoy!

## Sample image output📷
![alt SampleImageOutput](https://github.com/gaboyeji/CustomShaderWithMetalPetal/blob/main/SampleOutput/IMG_8576.jpg?raw=true)

## Issues ❓
>If you experience any issues. 

Create a [new issue](https://github.com/gaboyeji/CustomShaderWithMetalPetal/issues)
  * So everyone can benefit from it.

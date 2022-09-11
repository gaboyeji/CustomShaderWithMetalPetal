//
//  DistortFilter.swift
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//

// Model declaration for Distortion
struct DistortionParameters {
    var point: SIMD2<Float> = .zero
    var radius: Float = 0
    var direction: Float = 0
    var strength: Float = 0
    var density: Float = 0
    var width: Float = 0
    var height: Float = 0
}

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


class GADistortFilter: NSObject, MTIUnaryFilter {
    
    required override init() { }
    
    deinit {
        let className = String(describing: type(of: self))
        Debug.message(" \(className) released from memory")
    }
    
    class var name: String { return "" }
    
    /// border image Name
    var borderName: String { return "" }

    /// fragment shader name in Metal
    var fragmentName: String { return "GADistortFilterFragment" }
    
    /// fragment shader name in Metal
    var vertexName: String { return "GADistortFilterVertex" }

    /// Textures, key should match parameter name
    var samplers: [String: String] {
        return [:]
    }
    
    var parameters: [String: Any] {
        
        let buffer = MTIDataBuffer(bytes: [distortParameters], length: UInt([distortParameters].count * MemoryLayout<DistortionParameters>.size), options: .cpuCacheModeWriteCombined)!
        return ["distortParameters" : buffer]
    }
    
    var distortParameters: DistortionParameters = DistortionParameters()
    
    var outputPixelFormat: MTLPixelFormat = .bgra8Unorm
    var inputImage: MTIImage?
    
    
    /// Set the geometry specification according needs
    /// Pay particular attention to texture dimension i.e. 'inputImage.dimensions'
    /// Use cellSize to adjust smoothness of the texture modification ( increase/decrease as needed )
    lazy var geometry: DistortionGeometry = DistortionGeometry(width: Int(inputImage!.dimensions.width), height: Int(inputImage!.dimensions.height), cellSize: 4)
    
    
    var outputImage: MTIImage? {
        
        guard let inputImage = inputImage else {
            return inputImage
        }
        
        let renderCommand = MTIRenderCommand(kernel: self.kernel, geometry: geometry.points, images: [inputImage], parameters: parameters)
              
        return MTIRenderCommand.images(byPerforming: [renderCommand], outputDescriptors: [MTIRenderPassOutputDescriptor(dimensions: inputImage.dimensions, pixelFormat: outputPixelFormat, loadAction: .clear, storeAction: .store)]).first
        
    }
    
    lazy var kernel = MTIRenderPipelineKernel(
        vertexFunctionDescriptor: MTIFunctionDescriptor(name: self.vertexName, libraryURL: MTIDefaultLibraryURLForBundle(Bundle.main)),
        fragmentFunctionDescriptor: MTIFunctionDescriptor(name: self.fragmentName, libraryURL: MTIDefaultLibraryURLForBundle(Bundle.main)))
    
    

}

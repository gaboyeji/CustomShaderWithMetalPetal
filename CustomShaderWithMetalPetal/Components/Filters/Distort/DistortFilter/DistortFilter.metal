//
//  DistortFilter.metal
//  CustomShaderWithMetalPetal
//
//  Created by Gregory Aboyeji on 9/10/22.
//


#import "../../../../../MetalPetal/Shaders/MTIShaderLib.h"
#include "../IFShaderLib.h"

using namespace metalpetal;

/// Distortion parameter struct
typedef struct {
    float2 point;
    float radius;
    float direction;
    float strength;
    float density;
    float width;
    float height;
} DistortionParameter;

/// Custom vertex struct
typedef struct {
    float4 position [[ position ]];
    float2 textureCoordinate;
} VertexDistortOut;


/// Converts pixel coordinates to metal coordinates
float2 convertToMetalCoordinates(float2 point, float2 viewSize) {
    
    float2 inverseViewSize = 1.0 / viewSize;
    float clipX = (2.0f * point.x * inverseViewSize.x) - 1.0f;
    float clipY = (2.0f * -point.y * inverseViewSize.y) + 1.0f;
    
    return float2(clipX, clipY);
}


/// Convert metal coordinates to Pixel coordinates
float2 convertToPixelCoordinates (float2 clipPoint, float2 viewSize) {
    float xPixel = (viewSize.x * (clipPoint.x + 1.0f)) * 0.5f;
    float yPixel = (viewSize.y * (1.0f - clipPoint.y)) * 0.5f;
    return float2 (xPixel,yPixel);
}


/// Custom vertex shader
vertex VertexDistortOut GADistortFilterVertex (
    const device VertexIn * vertices [[ buffer(0) ]],
    uint vid [[ vertex_id ]],
    constant DistortionParameter &distortParameters [[ buffer(1) ]]
) {
    VertexDistortOut outVertex;
    VertexIn inVertex = vertices[vid];
    outVertex.position = inVertex.position;
    outVertex.textureCoordinate = inVertex.textureCoordinate;
    
    float2 position = convertToPixelCoordinates(float2(inVertex.position.x, inVertex.position.y), float2(distortParameters.width, distortParameters.height));

    float distanceToCenter = distance(position, distortParameters.point);

    if (distanceToCenter < distortParameters.radius) {
        float2 targetOffset = (float2(cos(distortParameters.direction), sin(distortParameters.direction)) * distortParameters.strength);
        float distanceFactor = distanceToCenter/distortParameters.radius;
        targetOffset = targetOffset * (1.0 - distortParameters.density / distanceFactor);

        float2 pt = position + targetOffset;
        float2 _position = convertToMetalCoordinates(pt, float2(distortParameters.width, distortParameters.height));
        outVertex.position.xy = _position;

    }
    
    return outVertex;
}


/// Custom fragment shader
fragment float4 GADistortFilterFragment (
        VertexDistortOut vertexIn [[ stage_in ]],
        texture2d<float, access::sample> sourceTexture [[ texture(0) ]],
        sampler sourceSampler [[sampler(0)]]
        )
{
    constexpr sampler s(coord::normalized, address::clamp_to_edge, filter::linear);
    float4 source = sourceTexture.sample(s, vertexIn.textureCoordinate);
    return source;
}










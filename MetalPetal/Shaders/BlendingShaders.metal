//
// This is an auto-generated source file.
//

#include <metal_stdlib>
#include "MTIShaderLib.h"

using namespace metal;
using namespace metalpetal;


fragment float4 normalBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = normalBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 darkenBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = darkenBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 multiplyBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = multiplyBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 colorBurnBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = colorBurnBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 linearBurnBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = linearBurnBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 darkerColorBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = darkerColorBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 lightenBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = lightenBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 screenBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = screenBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 colorDodgeBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = colorDodgeBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 addBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = addBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 lighterColorBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = lighterColorBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 overlayBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = overlayBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 softLightBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = softLightBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 hardLightBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = hardLightBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 vividLightBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = vividLightBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 linearLightBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = linearLightBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 pinLightBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = pinLightBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 hardMixBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = hardMixBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 differenceBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = differenceBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 exclusionBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = exclusionBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 subtractBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = subtractBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 divideBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = divideBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 hueBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = hueBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 saturationBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = saturationBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 colorBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = colorBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}


fragment float4 luminosityBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 blendedColor = luminosityBlend(uCb, uCf);
    return mix(uCb,blendedColor,intensity);
}

#define _threshold 0.55
#define _padding 0.05

float _colorClose(float3 yuv, float3 keyYuv, float2 tol)
{
    float tmp = sqrt(pow(keyYuv.g - yuv.g, 2.0) + pow(keyYuv.b - yuv.b, 2.0));
    if (tmp < tol.x)
      return 0.0;
       else if (tmp < tol.y)
      return (tmp - tol.x)/(tol.y - tol.x);
       else
      return 1.0;
}

constant float4x4 _RGBtoYUV = float4x4(
    float4(0.257,  0.439, -0.148, 0.0),
    float4(0.504, -0.368, -0.291, 0.0),
    float4(0.098, -0.071,  0.439, 0.0),
    float4(0.0625, 0.500,  0.500, 0.0)
);

constant float4 _chromaKey = float4(0.0, 1.0, 0.0, 1.);
constant float2 _maskRange = float2(0.05, 0.46);

//MARK: GreenScreen
fragment float4 greenScreenBlend_(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {



    float4 uCf = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 uCb = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);
    float4 keyYUV =  _RGBtoYUV * _chromaKey;
    float4 yuv = _RGBtoYUV * uCb;

    float mask = 1.0 - _colorClose(yuv.rgb, keyYUV.rgb, _maskRange);
    float4 texture = max(uCb - mask * _chromaKey, 0.0) + uCf * mask;

    return texture;
}

float rgb2y(float3 c)
{
    return (0.299*c.r + 0.587*c.g + 0.114*c.b);
}

float rgb2cb(float3 c)
{
    return (0.5 + -0.168736*c.r - 0.331264*c.g + 0.5*c.b);
}

float rgb2cr(float3 c)
{
    return (0.5 + 0.5*c.r - 0.418688*c.g - 0.081312*c.b);
}

float colorclose(float Cb_p, float Cr_p, float Cb_key, float Cr_key, float tola, float tolb)
{
    float temp = (Cb_key-Cb_p)*(Cb_key-Cb_p)+(Cr_key-Cr_p)*(Cr_key-Cr_p);
    float tola2 = tola*tola;
    float tolb2 = tolb*tolb;
    if (temp < tola2) return (0);
    if (temp < tolb2) return (temp-tola2)/(tolb2-tola2);
    return (1);
}

constant float4 _KeyColor = float4(0.,1.,0.,0.);
constant float _ColorCutoff = 0.2;
constant float _ColorFeathering = 0.33;
constant float _MaskFeathering = 1.0;
constant float _Sharpening = 0.5;
constant float _Despill = 1.0;
constant float _DespillLuminanceAdd = 0.2;

//https://github.com/otdavies/UnityChromakey/blob/master/Shaders/ChromaKey.shader
float maskedTex2D(texture2d<float, access::sample> tex, float2 uv)
{
    constexpr sampler s(coord::normalized, address::clamp_to_edge, filter::linear);
    float4 color = tex.sample(s, uv);
    // Chroma key to CYK conversion
    float key_cb = rgb2cb(_KeyColor.rgb);
    float key_cr = rgb2cr(_KeyColor.rgb);
    float pix_cb = rgb2cb(color.rgb);
    float pix_cr = rgb2cr(color.rgb);

    return colorclose(pix_cb, pix_cr, key_cb, key_cr, _ColorCutoff, _ColorFeathering);
}

fragment float4 greenScreenBlend(VertexOut vertexIn [[ stage_in ]],
                                    texture2d<float, access::sample> colorTexture [[ texture(0) ]],
                                    sampler colorSampler [[ sampler(0) ]],
                                    texture2d<float, access::sample> overlayTexture [[ texture(1) ]],
                                    sampler overlaySampler [[ sampler(1) ]],
                                    constant float &intensity [[buffer(0)]]
                                    ) {
    

    float2 uv = vertexIn.textureCoordinate;
    float4 bg = overlayTexture.sample(overlaySampler, vertexIn.textureCoordinate);
    float4 fg = colorTexture.sample(colorSampler, vertexIn.textureCoordinate);

    // Unmodified MainTex
    float4 color = fg;

    // Unfeathered mask
    float mask = maskedTex2D(colorTexture, uv);
    
    // Get pixel width
    float2 pixelWidth = float2(1.0 / colorTexture.get_width(), 0);
    float2 pixelHeight = float2(0, 1.0 / colorTexture.get_height());
    
    // Feathering & smoothing 
    float c = mask;
    float r = maskedTex2D(colorTexture, uv + pixelWidth);
    float l = maskedTex2D(colorTexture, uv - pixelWidth);
    float d = maskedTex2D(colorTexture, uv + pixelHeight);
    float u = maskedTex2D(colorTexture, uv - pixelHeight);
    float rd = maskedTex2D(colorTexture, uv + pixelWidth + pixelHeight) * .707;
    float dl = maskedTex2D(colorTexture, uv - pixelWidth + pixelHeight) * .707;
    float lu = maskedTex2D(colorTexture, uv - pixelHeight - pixelWidth) * .707;
    float ur = maskedTex2D(colorTexture, uv + pixelWidth - pixelHeight) * .707;
    float blurContribution = (r + l + d + u + rd + dl + lu + ur + c) * 0.12774655;
    float smoothedMask = smoothstep(_Sharpening, 1, mix(c, blurContribution, _MaskFeathering));
    float4 result = color * smoothedMask;

    // Despill
    float v = (2*result.b+result.r+result.r)/4;
    if(result.g > v) result.g = mix(result.g, v, _Despill);
    float4 dif = (color - result);
    float desaturatedDif = rgb2y(dif.xyz);
    result += mix(0, desaturatedDif, _DespillLuminanceAdd);
    //float4 tex = mix(bg, (result.xyz, smoothedMask), 1.);
    
    float4 _r = float4(result.xyz, smoothedMask);
    //result.a = smoothedMask;
    float4 texture = normalBlend(bg, _r);
    return texture;
    
}


//计算光照相关库
#ifndef CUSTOM_LIGHTING_INCLUDED
#define CUSTOM_LIGHTING_INCLUDED

//计算入射光照
float3 IncomingLight(Surface surface, Light light)
{
    return saturate(dot(surface.normal, light.direction)) * light.color;
}
//入射光照乘以BRDF的漫反射部分，得到的照明颜色
float3 GetLighting(Surface surface, BRDF brdf, Light light)
{
    return IncomingLight(surface, light) * DirectBRDF(surface, brdf, light);
}
//根据物体的表面信息获取最终光照结果
float3 GetLighting(Surface surface, BRDF brdf)
{
    //可见方向光的照明结果进行累加得到最终照明结果
    float3 color = 0.0;
    for(int i = 0; i < GetDirecitonalLightCount(); i++)
    {
        color += GetLighting(surface, brdf, GetDirectionalLight(i));
    }
    return color;
}

#endif
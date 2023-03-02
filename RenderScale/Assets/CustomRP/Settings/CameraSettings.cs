using System;
using UnityEngine.Rendering;
/// <summary>
/// 相机组件的扩展配置项
/// </summary>
[Serializable]
public class CameraSettings
{
    //是否拷贝深度和颜色
    public bool copyDepth = true;

    public bool copyColor = true;
    //设置相机的Rendering Layer Mask来限制相机的渲染
    [RenderingLayerMaskField]
	public int renderingLayerMask = -1;

	public bool maskLights = false;

	public bool overridePostFX = false;

	public PostFXSettings postFXSettings = default;
    //存储源和目标的混合模式
    [Serializable]
	public struct FinalBlendMode
	{

		public BlendMode source, destination;
	}

	public FinalBlendMode finalBlendMode = new FinalBlendMode
	{
		source = BlendMode.One,
		destination = BlendMode.Zero
	};
}
using UnityEngine;
/// <summary>
/// 后处理特效栈的配置
/// </summary>
[CreateAssetMenu(menuName = "Rendering/Custom Post FX Settings")]
public class PostFXSettings : ScriptableObject 
{
    [SerializeField]
    Shader shader = default;

	[System.NonSerialized]
	Material material;
	[System.Serializable]
	public struct BloomSettings
	{
        //模糊迭代次数
		[Range(0f, 16f)]
		public int maxIterations;
        //下采样纹理尺寸下限
		[Min(1f)]
		public int downscaleLimit;
        //双三次滤波上采样
		public bool bicubicUpsampling;
        //阈值
		[Min(0f)]
		public float threshold;
        //阈值拐点
		[Range(0f, 1f)]
		public float thresholdKnee;
        //Bloom强度
		[Min(0f)]
		public float intensity;
		//淡化闪烁
		public bool fadeFireflies;
        //Bloom模式：叠加或散射
        public enum Mode { Additive, Scattering }

        public Mode mode;
        //控制光线散射的程度
        [Range(0.05f, 0.95f)]
        public float scatter;
    }
    //色调映射的配置
    [System.Serializable]
    public struct ToneMappingSettings
    {
        //色调映射常用的几种模式
        public enum Mode {
            None = -1,
            ACES,
            Neutral,
            Reinhard
        }

        public Mode mode;
    }

    [SerializeField]
    ToneMappingSettings toneMapping = default;

    public ToneMappingSettings ToneMapping => toneMapping;

    [SerializeField]
	BloomSettings bloom = new BloomSettings
    {
        scatter = 0.7f
    };

    public BloomSettings Bloom => bloom;
	public Material Material
	{
		get
		{
			if (material == null && shader != null)
			{
				material = new Material(shader);
				material.hideFlags = HideFlags.HideAndDontSave;
			}
			return material;
		}
	}
}

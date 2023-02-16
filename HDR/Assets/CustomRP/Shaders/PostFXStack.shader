Shader "Hidden/Custom RP/Post FX Stack" {
	
	SubShader {
		Cull Off
		ZTest Always
		ZWrite Off
		
		HLSLINCLUDE
		#include "../ShaderLibrary/Common.hlsl"
		#include "PostFXStackPasses.hlsl"
		ENDHLSL
		//在水平方向的进行滤波
		Pass {
			Name "Bloom Horizontal"
			
			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomHorizontalPassFragment
			ENDHLSL
		}
		//在竖直方向的进行滤波
		Pass {
			Name "Bloom Vertical"
			
			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomVerticalPassFragment
			ENDHLSL
		}
		//Bloom叠加模式
		Pass {
			Name "Bloom Add"
			
			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomAddPassFragment
			ENDHLSL
		}
		//Bloom散射模式
		Pass {
			Name "Bloom Scatter"

			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomScatterPassFragment
			ENDHLSL
		}
		//Bloom散射的最终绘制
		Pass {
			Name "Bloom Scatter Final"

			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomScatterFinalPassFragment
			ENDHLSL
		}
		Pass {
			Name "Bloom Prefilter"
			
			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomPrefilterPassFragment
			ENDHLSL
		}
		//淡化荧光闪烁
		Pass {
			Name "Bloom Prefilter Fireflies"
			
			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment BloomPrefilterFirefliesPassFragment
			ENDHLSL
		}
		Pass {
			Name "Copy"
			
			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment CopyPassFragment
			ENDHLSL
		}
        //ACES 色调映射
		Pass {
			Name "Tone Mapping ACES"

			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment ToneMappingACESPassFragment
			ENDHLSL
		}
        //Neutral 色调映射
		Pass {
			Name "Tone Mapping Neutral"

			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment ToneMappingNeutralPassFragment
			ENDHLSL
		}
		//Reinhard 色调映射
		Pass {
			Name "Tone Mapping Reinhard"

			HLSLPROGRAM
				#pragma target 3.5
				#pragma vertex DefaultPassVertex
				#pragma fragment ToneMappingReinhardPassFragment
			ENDHLSL
		}
	}
}
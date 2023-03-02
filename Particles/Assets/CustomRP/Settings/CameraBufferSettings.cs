//相机缓冲区相关设置
[System.Serializable]
public struct CameraBufferSettings
{
    //是否启用HDR
    public bool allowHDR;
    //是否拷贝深度
    public bool copyDepth;
    public bool copyDepthReflection;
    //是否拷贝颜色
    public bool copyColor;
    public bool copyColorReflection;
}
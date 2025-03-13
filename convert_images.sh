# 示例脚本：convert_images.sh
# 说明 hugo 图片压缩脚本，需要安装 cwebp
#!/bin/bash

# 遍历 content/images 目录下的 PNG/JPG 图片
find /home/runner/work/hugo/hugo/static/00-assets -type f -name "*.png" -o -name "*.jpg" | while read img; do
  webp_path="${img%.*}.webp"
  # 调用 cwebp 转换（需提前安装 cwebp 工具）
  cwebp -q 80 "$img" -o "$webp_path"
done



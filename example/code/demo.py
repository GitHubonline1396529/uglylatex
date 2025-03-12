"""
demo.py - 示例代码
==================

一份示例代码，基于 :module:`scipy.cluster.hierarchy` 模块实现了系统聚类，
用于测试代码块高亮渲染和排版效果。聚类的数据来源于随即数据。

使用方法：

1. 直接运行代码即可查看代码运行结果。
2. 使用高亮渲染工具查看代码文件。
"""

# 导入必要的库
import numpy as np
import matplotlib.pyplot as plt

from sklearn.preprocessing import StandardScaler
from scipy.cluster.hierarchy import linkage, dendrogram

# 生成随机数据
np.random.seed(42)
data = np.random.rand(20, 2) * 100

# 标准化数据
scaler = StandardScaler()
data_normalized = scaler.fit_transform(data)

# 进行系统聚类
Z = linkage(data_normalized, method='ward')

# 绘制树状图
plt.figure(figsize=(10, 5))
dendrogram(
    Z, 
    leaf_rotation=90, 
    leaf_font_size=10
    )
plt.title('Hierarchical Clustering Dendrogram')
plt.xlabel('Sample index')
plt.ylabel('Distance')
plt.grid(True)
plt.tight_layout()
plt.show()

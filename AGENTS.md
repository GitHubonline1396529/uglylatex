# UglyLaTeX — AGENTS.md

## 项目概述

UglyLaTeX 是一套 LaTeX 文档类集合，包含三个模板（UglyNote、UglyPaper、UglyRep），支持直接通过 Pandoc 生成排版文档。项目还提供辅助 `.sty` 宏包文件。

## 目录结构

```
uglylatex/
├── texmf/tex/latex/uglylatex/    # 文档类 & 宏包源码
│   ├── *.cls                         # 文档类（uglynote, uglypaper, uglyrep）
│   ├── *.sty                         # 辅助宏包（颜色、格式、标题等）
│   └── customized_*/                 # 抽象模块（摘要、目录、页眉）
├── example/                       # 示例文档
│   ├── *-cn.tex                      # 三类模板的示例入口
│   └── mainbody-cn/*.tex             # 按章节拆分的示例正文
├── image/                         # 图片资源
├── Makefile                       # 构建系统
├── config.mk                      # 构建配置（TEXMF 安装路径等）
└── metadata.yaml                  # Pandoc 转 PDF 的 YAML 元数据
```

## 文档类

| 文档类         | 用途               | 文件                |
| -------------- | ------------------ | ------------------- |
| `uglynote.cls` | 轻量化笔记/博客    | `texmf/.../uglynote.cls`  |
| `uglypaper.cls`| 紧凑正式文档       | `texmf/.../uglypaper.cls` |
| `uglyrep.cls`  | 长报告（含封面摘要）| `texmf/.../uglyrep.cls`   |

## 构建命令

| 命令              | 作用                            |
| ----------------- | ------------------------------- |
| `make all`        | 打印项目信息                    |
| `make install`    | 将文档类安装到本地 TEXMF 目录   |
| `make example`    | 编译示例 PDF（需 latexmk）      |
| `make doc`        | Pandoc 转换 README.md 为 PDF    |
| `make clear`      | 清理示例目录的 AUX 和 PDF 文件  |

## Gitmoji 约定

提交信息使用 gitmoji 前缀，英文撰写。本项目常用 gitmoji：

| gitmoji       | 含义                   |
| ------------- | ---------------------- |
| `:sparkles:`  | 新功能/调整            |
| `:bug:`       | 修复 bug               |
| `:memo:`      | 文档/注释              |
| `:pencil2:`   | 修正拼写错误           |
| `:art:`       | 代码格式/重构/重命名   |
| `:bricks:`    | 构建系统相关           |
| `:truck:`     | 文件移动/重命名        |
| `:heavy_plus_sign:` | 添加依赖项      |
| `:globe_with_meridians:` | 国际化/翻译  |

## 命名与代码约定

- 文件名：小写英文，下划线分隔（`uglynote.cls`, `doccolor.sty`, `runinabstract.sty`）
- 类/宏包名：小写英文（`uglynote`, `doccolor`, `dependencies`）
- 示例文件以 `-cn` 后缀标识中文版
- 注释使用英文

## 工作流程

1. 修改 `.cls` / `.sty` 源码 → **不直接编译**，需重新安装到 TEXMF 或复制到项目目录
2. 验证改动 → 修改示例 `.tex` 中的对应章节，运行 `make example`
3. 最终确认 → 检查生成的 PDF 排版效果

## 测试

当前无自动化测试框架。验证方式为编译示例 PDF 并目视检查排版效果。

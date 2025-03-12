# Ugly\LaTeX：系列 \LaTeX 文档类

## 项目简介

自从 [Elegant\LaTeX](https://github.com/ElegantLaTeX/) 项目停更之后，我就时常感到十分的无措。尽管大家都说 [Elegant\LaTeX](https://github.com/ElegantLaTeX/) 的历史使命已经完成、已经过时了，不在适合继续维护，但是我本来是很喜欢这个项目的。系列模板使用起来也特别方便，尤其是可以通过在 Markdwon 文件的 YAML Header 中使用 `documentclass` 指定文档类，再通过 Pandoc 一次性转换为 PDF via \LaTeX 快速排版。

最初，为了满足我个人的使用需求，我自己搓了这几个模板。后来觉得比较好用，我就觉得应该发出来跟大家分享，大家一起用。但是因为我的技术比较菜，而且没有什么艺术细胞，做不到 Elegant，只能做到 Ugly，所以我把项目命名为了 Ugly\LaTeX ，很合理吧。

本项目旨在 **直接生成效果理想的排版文档**，因为我想简化流程，直接生成想要的文档格式，无需在正式编写文档的时候再去调整。[Elegant\LaTeX](https://github.com/ElegantLaTeX/) 曾经经常被认为是将各种功能模块写得太死了，想要在排版的时候进行进一步的个性化格式修改就会很困难。这个问题在本项目中非但有之，而且更甚。总之，本项目的理念就是要确保在排版的过程中不需要引入任何额外的样式修改，直接提供足够理想的终产物样式，并适配尽可能广的应用场景。

## 文档类安装

将文档类安装到计算机可以允许您在计算机上的任何位置调用本文档类进行写作，这对于快速编排文档，尤其是与 Pandoc 协同编写文档尤其有帮助。本文档类有 2 种安装方法：

1. 使用 Makefile 进行自动安装；
2. 手动安装到计算机目录。

### 使用 Makefile 进行自动安装

#### 确定安装位置

在安装文档类之前，您需要先确定合适的安装位置。通常，LaTeX 使用 **`TEXMF` 目录** 组织所有宏包、类文件和字体资源。`TEXMF` 目录可以是以下几种之一：

**A. 本地用户目录**（推荐）：适用于个人使用，不影响系统其他用户。可以使用 `kpsewhich` 命令查看安装目录：

```shell
kpsewhich -var-value TEXMFHOME
```

本地用户的 `TEXMF` 目录在不同的操作系统和不同的 \LaTeX 发行版上可能会有所不同。一般情况下，如果您使用 \TeX Live:

- **Linux/macOS**: `~/texmf`
- **Windows**: `%USERPROFILE%\texmf`

而如果您使用 MiK\TeX 则以一般用户身份启动 MiKTeX Console，打开“设置”，选择“目录”选项卡，可以将任何目录设置为用户自定义的 `TEXMF` 目录。

**B. 全局系统目录**（需要管理员权限）：适用于系统级安装，所有用户可用。同样地，你也可以可以使用 `kpsewhich` 命令查看全局系统目录：

```shell
kpsewhich -var-value TEXMFLOCAL
```

对于 \LaTeX 的全局系统目录，在不同的操作系统和不同的 \LaTeX 发行版上通常遵循如下原则：

如果您在 Linux/MacOS 上使用 \TeX Live，则该路径可能是 `/usr/local/texlive/texmf-local`。

如果您在 Windows 上使用 \TeX Live，比如，如果您安装了 \TeX Live 2023，则在您的 \TeX Live 安装目录下会存在一个 `2023` 目录[^1]和一个 `texmf-local` 目录。其中，`texmf-local` 是专门供您安装您的本地模板，以便此计算机上所有用户使用的。当然，您也可以将自定义的模板与其他 CTAN 包安装一起安装到 `2023` 目录下。

如果使用 MiK\TeX ，则您可以以管理员用户身份启动 MiK\TeX Console，打开“设置”，选择“目录”选项卡，从而将任何目录设置为全局的 `TEXMF` 目录。

#### 指定安装目录



## Q&A

### 在 Pandoc 中启用颜色

```yaml
# Enable document colors.
colorlinks: true
citecolor: ecolor
filecolor: ecolor
linkcolor: ecolor
urlcolor: ecolor
```

### 在 Pandoc 中启用代码换行

```yaml
# Warp lines in code blocks
header-includes:
  - \usepackage{fvextra}
  - |
    \DefineVerbatimEnvironment{Highlighting}{Verbatim}{
      breaklines,commandchars=\\\{\}
    }
```

[^1]: 该数字即您安装的 \TeX Live 年份版本号。
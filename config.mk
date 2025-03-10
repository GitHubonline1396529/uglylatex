# Name: config.mk
# Date: 2025/3/10
# Version: 0.1.0.0
# License: 
#
# If you're using texlive, for example, if you've installed your texlive in
# <D:/texlive> on windows, you would find a `texmf-local` folder under your 
# texlive install root, which is used for you to install your own custmized
# LaTeX packages. Set the `PREFIX` as following to install this LaTeX document
# class into your local system.

# PREFIX = /d/texlive/texmf-local

# In another way, if you're using MiKTeX instead, you can, for example, create
# a directory in <C:/Programs/texmf-local> by yourself, and add it into your 
# TEXMF ROOT LIST in your MiKTeX Console, for you to install your own LaTeX 
# packages. Then you can set the `PREFIX` as the following:

PREFIX = /c/Programs/texmf-local
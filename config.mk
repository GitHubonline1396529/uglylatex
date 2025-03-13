# Configurations for Makefile
#
# Name: config.mk
# Date: 2025/3/10
# Version: 0.1.0.0
# License: Copyright (c) 2025 Githubonline1396529
#
# `TEXMF` specifies the target installation directory (TEXMF directory)
# for this LaTeX document class.
#
# === Windows ===
# If you are using TeX Live and have installed it in, for example, `D:/texlive`
# on Windows, you will find a `texmf-local` folder inside the TeX Live
# installation directory. This folder is intended for user-installed LaTeX
# packages. To install this document class into your local TeX system, set
# `TEXMF` as follows:
 
TEXMF = /d/texlive/texmf-local
 
# Alternatively, if you are using MiKTeX, you can manually create a directory,
# such as `D:/Programs/texmf-local`, and add it to your TEXMF root list
# via the MiKTeX Console. This allows you to store your own LaTeX packages.
# In this case, set `TEXMF` as follows:

# TEXMF = /d/Programs/texmf-local

# Note: In POSIX-compatible environments for Windows, such as MSYS2, drive
# letters are represented as `/c`, `/d` instead of `C:`, `D:`. If you're
# using Cygwin or WSL, maybe your drivers are mounted under `/mnt` director.

# TEXMF = /mnt/d/texlive/texmf-local
# TEXMF = /mnt/d/Programs/texmf-local

# === Linux & macOS ===
# If you are using TeX Live on Linux or macOS, user-installed packages should 
# typically be placed in `~/texmf` (inside the home directory). This is the
# recommended location for personal LaTeX files, as it does not require root
# privileges.
#
# To install the document class in your local user directory, set:

# TEXMF = ~/texmf

# If you prefer a system-wide installation, TeX Live uses `/usr/local/texlive`
# as the default root. The corresponding `texmf-local` directory is used for
# local package installations. You will need root privileges (sudo) to install
# packages here. Set `TEXMF` as follows:

# TEXMF = /usr/local/texlive/texmf-local

# After installation, remember to run `mktexlsr` to refresh the file database
# so TeX can recognize the new document class.

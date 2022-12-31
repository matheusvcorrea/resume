# Refer to https://github.com/xu-cheng/latex-docker

# from ghcr.io/xu-cheng/texlive-small:latest
from ghcr.io/xu-cheng/texlive-full:latest

copy . /project

workdir /project

cmd make clean pdf

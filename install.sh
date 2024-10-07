#!/bin/bash

mkdir -p $HOME/.config/nvim/lua/plugins/luasnip/tex

cp ./snippets/bib.lua $HOME/.config/nvim/lua/plugins/luasnip
cp ./snippets/tex/* $HOME/.config/nvim/lua/plugins/luasnip/tex

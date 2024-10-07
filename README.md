# latex-luasnips

This repository contains some useful LaTeX snippets for the [LuaSnip](https://github.com/L3MON4D3/LuaSnip) engine, most made by me and some collected from other repositories, specifically, the great snippets for the `case` and `matrix` mathematical environments made by [evesdropper](https://github.com/evesdropper/luasnip-latex-snippets.nvim) and the indispensable `get_visual` function for snippets with visual placeholders, taken from [ejmastnak](https://ejmastnak.com/tutorials/vim-latex/luasnip/). These snippets depend on [vimtex](https://github.com/lervag/vimtex) for math context.

# What are snippets? What is LaTeX?

[ejmastnak](https://ejmastnak.com/tutorials/vim-latex/intro/) answers all these questions better than I could do. His guide is a must read. Another classic on this topic is due to [gillescastel](https://castel.dev/post/lecture-notes-1/). However, you can check out the showcase gifs section to get an idea of what this is all about.

# Documentation

All of these snippets have detailed documentation specifying their name, trigger, whether it is automatic, visual, and what LaTeX packages it needs (if any). You can find a pdf file with this documentation in the doc folder. Some general tips and observations for using these snippets are as follows:

- A few snippets have a `*` in the package field, this means that the code inserted by the snippet needs a custom command (macro) defined in the preamble, these definitions can be found at the end of the documentation file in the `Preamble macros` section. If this field has both a package name and a `*`, it means it needs both, for example, `amsmath*` means that the command inserted requires the `amsmath` package and a macro.

- Some snippets have more than two commands associated with them, this means that you can choose between both, that is, they're choice nodes. Generally you cycle through them using a shortcut, in my case it's `C-j` to go to the next option and `C-k` to go back. If you don't know how to specify this in your config file, you can consult the ChoiceNode section in [L3MON4D3](https://github.com/L3MON4D3/LuaSnip/blob/master/DOC.md). In my init.vim:

```
imap <silent><expr> <C-j> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-j>'
smap <silent><expr> <C-j> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-j>'
imap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-k>'
smap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-prev-choice' : '<C-k>'
```

- Although not specified, math snippets only work in math mode. All others work everywhere.

# Installation

Clone this repository

```
git clone https://github.com/isaac098098/latex-luasnips
cd latex-luasnips
```

Run the installation script
```
sudo chmod +x install.sh
./install.sh
```
**Warning**: This script will override any file inside `$HOME/.config/nvim/lua/plugins/luasnip/` named `bib.lua` and all the files inside `$HOME/.config/nvim/lua/plugins/luasnip` named `bibtex.lua`, `floats.lua`, `fonts.lua`, `formatting.lua`, `math.lua`, `structure.lua` or `templates.lua`.

**Warning 2**: This installation method assumes that your snippets live in the directory `$HOME/.config/nvim/lua/plugins/luasnip/`, if not simply copy the contents of `snippets/` to the appropiate place.

## Gifs

### Hodge conjecture

![Hodge conjecture](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/hodge.gif)

### Fatou's lemma

![Fatou's lemma](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/fatou.gif)

### Gauss divergence theorem

![Gauss divergence theorem](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/gauss.gif)

### Matrices (due to [evesdropper](https://github.com/evesdropper/luasnip-latex-snippets.nvim))

![Matrices](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/matrix.gif)

### Chudnovsky algorithm

![Chudnovsky algorithm](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/chudnovsky.gif)

### Schrödinger equation

![# Schrödinger equation](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/sch.gif)

### Visual placeholder (example from [ejmastnak](https://ejmastnak.com/tutorials/vim-latex/intro/))

![Visual placeholder](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/it.gif)

The text is first selected using the visual mode with `v`, or `V` for entire lines, then it is then temporarily saved with the `Tab` key, then the snippet is written and expanded. All snippets marked as `visual` do this.

### From scratch document

![From scratch document](https://github.com/isaac098098/latex-luasnips-assets/blob/main/gifs/doc.gif)

</details>

# Anki

If you want to increase your writing speed with these snippets, you can start memorizing them, this will help you tremendously, especially the math ones. For this I made an Anki deck of cards, in which you have to write the corresponding snippet given a command or formula. It contains the subdecks **bib**, **bibtex**, **floats**, **fonts**, **formatting**, **math** and **structures**, although as I said, the most convenient to study is **math**. You can find it as `LaTeX LuaSnips.apkg` in the `anki` folder. Don't worry, this deck doesn't use Anki's MathJax to display formulas, it just contains images, so you can use it on any computer without configuring anything. I recommend setting the **New cards/day** to a high number in this deck, for it is not difficult to memorize the snippets since they only consist of strings of 2, 3 or 4 characters. I also recommend setting **New card gather order** to **Random cards** in the deck options. If you want to leave the deck as new, simply delete it and import it again. Of course all your statistics will be lost.

### Studying the `math` deck with Anki

![Studying the math deck with Anki](https://github.com/isaac098098/latex-luasnips-assets/blob/main/anki/anki.gif)

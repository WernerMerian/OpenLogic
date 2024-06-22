# Directory

This file explains the directory management of the project, and the source code organisation.

## Organisation of the working directory

```bash
.
├── assets
│   ├── images
│   ├── logos
│   ├── photo
│   └── tikzpictures
├── ?!
│   ├── bib
│   └── glo
├── build
├── content
│   [...]
├── courses
│   [...]
├── doc
├── include
├── misc
├── preamble
│   ├── cmd
│   ├── env
│   ├── modularity
│   ├── packages
│   ├── symbols
│   ├── versions
│   └── wrappers
├── out
├── wki
├── .git
└── .github
```

main.tex

Makefile
.latexmkrc

AUTHORS.md
COMPILATION.md
DIRECTORY.md
LICENSE.md
README.md

.gitignore
.gitmodules




pour simplifier le dossier, retirer tous les .md à part le README et le LICENCE, et mettre tous les autres dans le wiki, et mettre un index de toutes les pages wiki dans le README

## Organisation of the source code


### les fichiers "main"

```tex
[open-logic-debug.tex]

% open-logic-debug.tex
% master file to produce debug version
% includes all references, markup, etc.
```

-> importe ./sty/open-logic.sty et ./sty/open-logic-debug.sty

```tex
[open-logic-complete.tex]

% open-logic-complete.tex
% master file to produce a complete release version
% without references, markup, etc.
```

-> importe ./sty/open-logic.sty et ./sty/open-logic-defer.sty


### Preambule

./sty/open-logic.sty

1ère partie: charge plein de packages et les config
2nde partie: y'a tout plein de trucs

importe ./open-logic-config.sty et ./open-logic-envs.sty
importe ./sty/open-logic-tokenize.sty

### Macros et envs

./open-logic-complete-config.sty (+declare tokens +active des tags)
./open-logic-envs.sty (déclare environnements)

### Tikz structures

./sty/ptolemaicastronomy.sty

Malgré ce qu'il veut nous faire croire, c'est bien un recueil de strutures tikz, avec des macros intercallées ici et là, mais c'est bien des structures tikz qui sont def in fine

### Config locale ???

./open-logic-config.sty


### packages locaux et tiers

**packages officiels**

./sty/bpextra.sty

```tex
% Wrapper for backwards compatibility
```

./sty/bussproofs-extra.sty

```tex
%% This is file `bussproofs-extra.sty',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% bussproofs-extra.dtx  (with options: `package')

\ProvidesPackage{bussproofs-extra}
   [2019/05/31 0.4 Extra commands for bussproofs.sty]
```



**package perso**

./sty/open-logic-debug.sty

```tex
% debug commands
```

./sty/open-logic-defer.sty

```tex
% Package for deferring processing of environments
```

./sty/open-logic-referencing.sty

```tex
% Package for crossreferencing
```
-> en vrai, c'ets pas vraiment un package: c'est une surcouche pour plusieurs packages officiels, qui permet des les "unifier", donc c'est une sorte de méta-package. c'est ce que moi j'appelle un "service" mais faudrait revoire la terminologie,

package
module
library
framework

### Mécanismes développés pour la modularté

./sty/open-logic-formulas.sty
./sty/open-logic-selective.sty (lui c'est presque un package nan ? et devrait pas plutôt s'appeler tag ???)
./sty/open-logic-tokenize.sty

### Format d'impression papier

./sty/open-logic-book.cls
./sty/open-logic-book-envs.sty

du coup le dossier ./courses/ faudrait le renommer en ./books/

et enfait on pourrait carrément rajouter d'autres formats de sortie (voir HoTT), donc faudrait avoir à la place un dossier ./out/ et comme sous-dossiers ./books/, ./kindle/, ...

ok en fait ./out/ faudrait plus le réserver pour les version "crues" compilées avec le main (genre final.pdf et debug.pdf). Donc pour les bouquins, on pourrait l'appeler ./formats/ ou ccch du genre




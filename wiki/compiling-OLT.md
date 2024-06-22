# Compiling OLT

To compile material from the OLT yourself, you (a) need to [download the source files](https://github.com/OpenLogicProject/OpenLogic/wiki/Downloading-OLT) and (b) install [LaTex](https://github.com/OpenLogicProject/OpenLogic/wiki/LaTeX) on your machine. (If you do not want to do that, there are pre-compiled PDFs on the [builds site](builds site).)

## The source code

The material is organized into [sections](./sections.md), [chapters](./chapters.md), [parts](./parts) in the `content/` subdirectory. You can run LaTeX on each file in `content/` or on a driver file that loads those source files (plus perhaps other material) in some order. Each section source file, as well as the source files to compile chapters and parts, do not have a separate preamble, but refer to `include/open-logic-section.tex`, `include/open-logic-chapter.tex`, and `include/open-logic-part.tex`, respectively. The main directory contains two driver files that load the entirety of the Open Logic Text, `open-logic-debug.tex` and `open-logic-complete.tex`.

Although sections, chapters, and parts can be compiled on their own, this will only really be useful for proofing them. Note in particular that cross-references to other material will in general not work.

The files `open-logic-debug.tex` and `open-logic-complete.tex` in the main directory will produce a PDF of the entire text. The former will contain links to [GitHub](https://github.com/OpenLogicProject/OpenLogic/wiki/Git) and other "debugging" information, such as color-coded text and names of labels printed in the margins. The latter will produce a more finished-looking text. But neither is primarily intended for study or teaching.

## Compiling

Every file should compile on its own using `latex` or `pdflatex`. As usual, you'll need a couple of runs plus a run of `bibtex` or `biber` to get cross-references and bibliography correct.

Note that to get the links produced in the debug version, you'll have to run `pdflatex` with the `-recorder` flag, e.g.,
```bash
pdflatex -recorder open-logic-debug
```
You can also install and use the `latexmk` tool, which does this automatically. In this case, use
```bash
latexmk -pdf open-logic-debug 
```

## Tailored driver files

To see what a more tailored driver file for a textbook produced from OLP might look like, go to `courses/sample/`. That directory contains two files. `open-logic-sample.tex` is a driver file that, when compiled, produces a selection of material with configuration options suitable for a textbook.

To make your own driver file, perhaps the easiest thing is to copy the `courses/sample` directory to a new subdirectory of `courses/`, say `courses/myversion`. Then rename the files in there to `courses/myversion/myversion.tex` and `courses/myversion/myversion-config.sty`. That will give you something to start from.

There are other, more involved sample textbooks you could use as inspiration or as a starting point, e.g.,:

- [Sets, Logic, Computation](https://github.com/rzach/phil379)
- [Incompleteness and Computability](https://github.com/rzach/phil479)

If you don't want to go to all that complexity, or you just want a PDF of a few sections, that's possible too. You just need to put a few things in your document.

1. Your document should start with
  ```tex
  \documentclass{memoir}
  ```
  You don't *have* to use the `memoir` class, but you will get a bunch of error messages if you use a class that doesn't define the `chapter` heading, since the default `open-logic-envs.sty` numbers theorems, etc., within `chapters`. So, e.g., `report` also works but not `article`, which doesn't have `chapters`. You can edit your `...-envs.sty` file accordingly though if you don't want that. Deferring problems to the back or to the end of chapters also won't work, since `sty/open-logic-defer.sty` assumes that memoir's `\memendofchapterhook` command is present.
2. You have to specify where all the OLP-related stuff lives by defining the `\olpath` command, e.g., if you're working in a folder that's parallel to where you put the OLP files, put this in your preamble:
  ```tex
  \newcommand{\olpath}{../OpenLogic/}
  ```
  Somewhere in your preamble, you have to load all the OLP-specific code the material uses:
  ```tex
  \input{\olpath/sty/open-logic.sty}
  ```
  Anywhere in your document you can now include material from the OLP, e.g., a part, chapter, or section, by saying:
  ```tex
  \olimport*[sets-functions-relations]{sets-functions-relations}
  \olimport*[first-order-logic/natural-deduction]{natural-deduction}
  \olimport*[first-order-logic/beyond]{second-order-logic}
  ```
  You can also use any of the commands defined for OLP in your file, e.g., you can copy and paste material from any of the OLP files and change it as you see fit, or write your own.

## Changing the configuration

You may not like the way the standard configuration file deals with things. If you want to change them, you should add a file `mydocument-config.sty` in the same folder as the document you are compiling. In the sample course text, the configuration options are set in `courses/sample/open-logic-sample-config.sty`. These commands supercede those in the master [configuration file](./configuration-file.md), but the main configuration file is loaded first. (There is a [PDF documenting the configuration options](http://builds.openlogicproject.org/open-logic-config.pdf).)

You can define how you want metavariables for [formulas](./formulas.md) to appear in here as well.

If you want the various environments (theorems, definitions, asides, etc.) to be typeset differently, copy `open-logic-envs.sty` in the main directory to `courses/myversion/myversion-envs.sty` and edit this as you see fit. (If this file is present, `open-logic-envs.sty` will *not* be loaded, so your version must contain code to typeset all the environments used in the text.

## Troubleshooting

- To get photographs in the logician biographies, you also have to install the [photos repository](https://github.com/OpenLogicProject/photos).
- If you get the error
  ```tex
  LaTeX Error: \memendofchapterhook undefined.
  ```
  then it means that you have an old version of `memoir.cls` installed (or you're using `sty/open-logic-defer.sty` with a class other than `memoir`). You can get the most recent version from [CTAN](https://www.ctan.org/tex-archive/macros/latex/contrib/memoir/?lang=en), but you should probably just update your entire TexLive or MikTeX installation.

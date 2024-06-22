# Conversion Options

## Summary Of Options For Converting The OLP To Other Formats

The Open Logic Book is currently written in LaTeX, and relies on a number of book specific macros for its customizability. We want to convert the book to other formats, for example HTML and EPUB to make it more accessible. To that end, we have been investigating options for converting LaTeX to other formats. We focus heavily on the conversion of mathematics typeset in LaTeX to other formats, because all of the tools do plain text very well.

### The Ideal Situation

My "blue sky" typesetting system for formal systems (logic, mathematics, and so on) is one in which the formal objects are specified completely according to the rules of the system they are a part of, and are typeset by a specialized process. Targeting different markup languages and display formats would be a matter of writing a typesetting proces for the system whose objects you want to typeset for each type of output. This approach is completely modular, with the content entirely separate from its presentation. Additionally, for many formal systems we can verify the sensibility of the formal object in question automatically (as in type checking for dependently typed programming languages). Such a system is absolutely possible with existing techniques, but would likely require several years to reach a point where it could be used for everyday typesetting, and would require much of the Open Logic Book to be rewritten. It is therefore clearly not an acceptable solution to the problem we have now.

### The Actual Situation (LaTeX is terrible)

The TeX typesetting system and LaTeX macro package are both arcane and very poorly documented, having been built up in an ad-hoc way by a multitude of different people over many decades. Further complicating matters is that LaTeX "macros" can perform arbitrary computations, and can change the state of "registers" on which the output of other macros may depend. Thankfully, most LaTeX documents use only a small set of macro packages which contain only relatively sane macros of the "replace this with that" variety. It is these common packages that are supported by the available conversion tools. While many of the conversion tools provide an extension mechanism, allowing us to add support for new and exotic packages, it is far easier to deal with "common LaTeX". Additionally, many people consider LaTeX an archival format, and suitable for the long term preservation of mathematical content. This becomes more of a funny joke than a serious proposition when arbitrary macro packages are introduced.

## Conversion Tools

This section is a summary of the available conversion tools

### Tex4ht

[Tex4ht](http://www.tug.org/tex4ht/) is really a collection of smaller programs that each do something more specific. The end result is a converter that works on everything I was able to find, but that responds to most mathematical content by constructing a poor quality bitmap image and embedding it in the resulting HTML document. The software is unfinished and unpolished, this is understandable snce the main author died unexpectedly in 2009. The documentation is relatively poor, and while it is purported to be extensible, instructions for extending it are nowhere to be found. The stability and future availability of this tool both look poor. I cannot recommend using this for the Open Logic Book.

### Pandoc

[Pandoc](http://pandoc.org/) aims to be a universal document conversion tool, and does this very well for the most part. The aim of the project, however, is not the conversion of mathematical content, which makes sense as most formats don't really support it. It has an excellent community and will likely be maintained for some time to come. Anything we can have Pandoc do for us is already done by the other converters on the list, which are more specialized and relevant to our problem.

### LaTeXML

[LaTeXML](http://dlmf.nist.gov/LaTeXML/) was developed specifically for the purpose of converting LaTeX math to other formats. It does this reasonably well, and is a mature technology. The documentation is good, and the converter is extensible, allowing us to add support for new packages. The software will probably be available for some time. The downside is that the whole thing is written in Perl, which is notoriously unreadable and difficult to maintain. Extending the system involves writing "bindings" for each package one wants to support, which tell the converter how to treat each new macro.

### Hevea

[HeVeA](http://hevea.inria.fr/) is a newer (2013) conversion tool written in OCaml with support for common latex math packages. The software is extensible much as LaTeXML is, and has some nice features (good error reporting and warnings, sane looking extension framework). The software appears to be actively developed, and the online manual appears complete. Also encouraging is that is has been used as part of a [LaTeX to EPUB](https://github.com/rzoller/tex2ebook) conversion toolchain with good results.


## Things We Could Do

The following could all work.

### Extend LaTeXML

By developing bindings for all the packages we need and potentially changing the include structure of the book, we might be able to convert it to structured HTML using only LaTeXML. This would be nice. We could also "cheat" and develop bindings for the open logic project macros directly, ignoring all the packages they depend on.

### Extend Hevea

As above, but we get to work with OCaml instead of Perl.

### Preprocess The Book To Common Latex

We could also write out own preprocessor that converts the special syntax to common latex, which is dealt with very well by both Hevea and LaTeXML, and then use either of those. This would be no more difficult than writing bindings for either of the two tools. It would also allow us to do literally whatever we want to syntax wise.

## What I Think We Should Do

My opinion is that the best approach is to preprocess the book using a custom tool, and then feed the resulting common latex through Hevea. My reasoning is that writing bindings for LaTeXML or Hevea amounts to specifying how to replace the new commands with common latex commands anyway, just in a more restrictive setting. We have to write our own parser for the custom commands, but this is not actually such a big deal. If done correctly, it would also be extensible. The preprocessor should read "replacement instructions" from a configuration file (much like bindings for the other two). From a format convertibility and technical simplicity standpoint, building the custom syntax and book configurability mechanisms in LaTeX was a mistake. With an external preprocessor, we can build in arbitrary functionality more simply, and can do complicated things while keeping the generated markup "common LaTeX". The reason I suggest Hevea instead of LaTeXML is that if we succeed in converting to HTML with Hevea, we can use the [Tex2Ebook](https://github.com/rzoller/tex2ebook) toolchain to generate EPUB with no modifications. LaTeXML would also work for generating HTML.


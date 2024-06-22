# LaTeX Features Packages Conversion Requirements

To determine which tool is best suited for converting OLP to other formats (esp ebook), it's crucial to determine a) which tools support how may of the packages OLP uses and b) how easy/hard it would be to expand these tools to cover the functionality needed. See [Conversion Options](./conversion-options.md).

Some features of the OLP will be most easily dealt with by pre-processing. For instance, instead of fiddling with a conversion tool to deal with `!A` for formulas, replace these by, e.g., `\formula{A}` or directly by the output token, e.g., `A` or `\phi`. The same goes for `!!{formula}` etc.

## LaTeX Packages Used/Supported

| Package    | Purpose       | LatexML   | HeVeA       | Pandoc | Remarks                    |
+============+===============+===========+=============+========+============================+
| amssymb    | various math  | Yes       | Most        | ?      |                            |
|            | symbols,      |           |             |        |                            |
|            | fonts         |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| amsmath    | math          | Yes       | Some        | ?      |                            |
|            | environments, |           |             |        |                            |
|            | e.g., align,  |           |             |        |                            |
|            | cases         |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| bussproofs | typeset proof | No        | No          | No     | could switch to proofs.sty |
|            |               |           | (but does   |        | as an alternative.         |
|            | trees         |           | support     |        |                            |
|            |               |           | mathpartir) |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| tikz       | diagrams of   | Sort Of.  | Sort Of. It | ?      | question will mainly be:   |
|            | various sorts | It tries. | tries.      |        | how nice are the pictures  |
|            |               |           |             |        | the tools produce?         |
+------------+---------------+-----------+-------------+--------+----------------------------+
| xparse     | make new      | No        | No          | No     | only needs                 |
|            | commands      |           |             |        | \DeclareDocumentCommand    |
|            | with flexible |           |             |        |                            |
|            | optional      |           |             |        |                            |
|            | arguments     |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| etoolbox   | tags and tag  | No        | No          | ?      | needs etoolbox's toggles   | 
|            | processing in |           |             |        | and docsvlist commands     |
|            | sty/o-l-      |           |             |        | only                       |
|            | selective.sty |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| verbatim   | supress text  | Yes       | Yes         | ?      |                            |
|            | selectively   |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| cleverref  | add           | No        | Yes         | ?      | poorman option generates   |
|            | corresponding |           |             |        | sed script that can be     |
|            | types before  |           |             |        | used for preprocessing if  |
|            | references,   |           |             |        | not supported              |
|            | e.g. "see     |           |             |        |                            |
|            | Theorem 2.1"  |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| thmtools   | defines       | No        | No          | ?      | low priority; cleverref    |
|            | theorem envs  |           |             |        | names can be hand-coded    |
|            | and works     |           |             |        |                            |
|            | nicely with   |           |             |        |                            |
|            | cleverref     |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| natbib     | bibliographic | Yes       | Yes         | ?      | not yet used. support may  |
|            | references    |           |             |        | influence choice.          |
+------------+---------------+-----------+-------------+--------+----------------------------+
| biblatex   | bibliographic | Yes       | No          | ?      | not yet used. support may  |
|            | references    | (There    |             |        | influence choice.          |
|            |               | appears   |             |        |                            |
|            |               | to be a   |             |        |                            |
|            |               | bibTeX    |             |        |                            |
|            |               | binding   |             |        |                            |
|            |               | including |             |        |                            |
|            |               | biblatex) |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+
| subfiles   | managing      | No        | No          | ?      |                            |
|            | subfiles,     |           |             |        |                            |
|            | allowing      |           |             |        |                            |
|            | sections to   |           |             |        |                            |
|            | be easily     |           |             |        |                            |
|            | compiled      |           |             |        |                            |
|            | alone         |           |             |        |                            |
+------------+---------------+-----------+-------------+--------+----------------------------+


 	

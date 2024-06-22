# Open Logic Quick Start Guide

This page describes all the steps required to install and compile the Open Logic Text on your computer, including installation of LaTeX (the typesetting program OLT uses) and Git. Please see the pages on LaTeX and Git for more information on what those are if you don't know already. You can avoid using Git by downloading OLT directly, but it makes it harder for you to keep up-to-date with changes to the text, and us to incorporate any contributions you make.
Installing LaTeX and Git

A LaTeX environment is necessary for both building a version of the Open Logic Book and contributing to the project. While it is possible to build the book without [Git], the project is currently hosted on Github, and you will need Git to contribute to the project.
Linux

The easiest way to get a working LaTeX environment on the majority of Linux systems is to install TeX Live through the package manager. The name of the package varies (texlive for Debian and Ubuntu with aptitude, texlive-most for Arch Linux with pacman, texlive and texlive-latex for OpenSUSE with libzypp). If TeX Live is not available through your distribution's package manager or your distribution does not use a package manager (Gentoo), follow the instructions on the website to download and install TeX Live. To compile a .tex file into a .pdf file, use the pdflatex command at the command prompt.

Similarly, install git through your package manager. For an introduction to git specific to the Open Logic Project, see below.
Windows

Download the TeX Live installer for windows and run the executable. The installer will guide you through the installation process. Do not be alarmed if it takes a long time for the installer to download all the required packages. After installation is complete, you should be able to double click on latex source files to open them in the editor, from where you can click the green "play" button in the upper left hand corner of the interface to compile the document.

If you only want to build a custom version of the book, you don't need to install Git on your system, it is enough to click the "Download ZIP" button on the right hand side of the Github interface on the project page, and extract the contents to a convenient location. If you want to contribute to the project, the easiest way is probably to install Github for Windows.
OSX

Install MacTeX to obtain a LaTeX environment. If you're comfortable with the command line, install Git. If you choose the command line most of the instructions and advice for Linux systems will apply to you also. If you prefer a GUI, install Github for Mac. Ideally you will install both, allowing you to try typing the git commands as they appear for Linux users, with the GUI as a fallback if something isn't working for you.
Git Primer: "Fork" and Other Verbs

Git is the distributed version control system used by the Open Logic Project. It allows multiple people to work on the project at the same time, and makes creating your own version of the project and incorporating your changes into the main project easy. A collection of files managed with Git is called a repository. The Open Logic Project repository is hosted on Github, a hosting service for Git repositories with a nice web browser interface. Git is a somewhat complicated system, and can be intimidating for new users. The aim of this section is to help you become comfortable with what Git is and get you started using it.

To contribute to the Open Logic Book, you will probably want to register an account with Github. While this is not necessary if you are looking only to use the text, and not strictly necessary if you would like to contribute to the project, it will make both of these things far easier. During the account creation process you may be asked to choose a payment plan. The free one will suffice.

Once you have a Github account, the first thing you should do is create a copy of the the OpenLogic repository tied to your account. To do this, log in to your Github account, and click the "Fork" button on the page for the repository (In the upper right hand corner of the web interface). A copy of the repository should now be displayed on your Github profile page at https://github.com/<yourusername>. Any changes you make to this repository will not be reflected in the main OpenLogic repository. You can request that your changes be added to the main repository by issuing a "pull request", covered here.

Now that you have your own copy of the project files on Github, the next step is to get those files on your computer. If you're using git from the command line, navigate to the directory you want the files to be in and enter

git clone https://github.com/<yourusername>/OpenLogic

at the command prompt.

If you're using the Github GUI interface for Windows (or the similar application for OSX), you need to link your Github account to the instance of the software on your computer. If you are not prompted to do this when you first start it up, you can do it by clicking the gear icon in the upper right corner of the main window of the application. Once you have linked your account, you will be able to clone your fork of the OpenLogic repository by clicking the plus sign icon in the upper left corner of the main window, and selecting "clone", and finally selecting your fork of the repository. You will be prompted to enter a save location, and it doesn't matter what this is as long as you remember it. Once you have done this, the copy of the files on your computer will behave much the same as for Linux and OSX users, with the difference that you will have to use the Github for Windows application instead of the command line to do the things described below. The Github for Windows application comes with a low-powered "shell" that will act a bit like a Unix command prompt, and makes it easier to perform more complex operations should the need arise. Please consult the documentation for more information on the Github for Windows application.

There are three sorts of basic changes you can make to the repository, adding new files, changing old files, and removing old files. To add a new file called file.ext to the repository, move the file to the OpenLogic directory on your computer and type git add file.ext. This tells git to keep track of file.ext. To make changes to a file that git is already keeping track of (such as the files that were in the repository when you cloned it), simply edit the file. To remove a file called file.ext from the repository, type git rm file.ext at the command prompt. This not only tells git to stop tracking the file, but deletes it. To record changes you have made, type git commit -m "summary of changes" at the command prompt. If you don't want to record your changes, you can type git reset to restore the repository to the state it was in immediately after the last commit. Finally, to synchronize the changes you have made with the version of the repository on Github, type git push at the command prompt (after committing your changes).

If you are using Github for Windows it easy to commit and push changes. Once you have edited a document that Git is currently tracking, or added a new document to the OpenLogic directory on your computer, it will pop up in Github for Windows as an uncommitted change. You can select/deselect files to commit at this point. You must write a summary of the commit, and are given the option to add a short description. Once you have done so, hit the commit button. At this point, the changes you have made will not be reflected in the version of the repository on Github. You should see that the sync button at the top of the application now has a number beside it, reflecting the commits that have yet to be pushed to Github. When you are ready to push your changes, click the sync button.

To request that your changes be reflected in the main Open Logic Project repository, submit a pull request.

The pull request can be done directly from Github for Windows, but the application does not have a compare and review feature. If you'd like to do a comparison of the changes you've made before submitting a pull request, follow the instructions linked to above. If you'd like to do the pull request directly from Github for windows, you can do so by clicking the pull request button to the left of the sync button. The program will show you which branch the changes are being taken from, and where you are sending the updates to. The default options for the pull request should be correct, but you may want to double check that the pull request is being sent to the correct place (in most cases, this should be from your master branch into OpenLogicProject/master). You'll have to enter a title, and if you'd like, a description. Then click "Send pull request", and you're done!

If you want to update your copy of the repository to include changes in the main repository that have happened since you made the copy, read this. Alternatively, and if the "upstream" changes can be synced into your fork without manual intervention, you can use the Github web interface to sync changes from the main repository into your fork. To do this, proceed as if you were sending a pull request, but switch the "base fork" and "head fork". (The base for should be "yourid/OpenLogic", the head fork "OpenLogicProject/OpenLogic"; and in each case the branch should be "master"). Github will tell you if an automatic merge is possible. If it is, you will have sent yourself a pull request that you can merge.
Building the Open Logic Book

Once you have a working LaTeX installation and a copy of the Github repository on your computer, you can compile a custom edition of the Open Logic Book. To build the complete book (all chapters included), compile the open-logic-complete.tex file. The open-logic-debug.tex file also produces a complete PDF, but with extra debugging information that helps to keep track of labels of theorems and the like, and which files which parts of the final PDF come from.

The files in the main directory should not be changed. To make a customized version of the book, instead go to the courses directory, and copy the sample subdirectory. Your copy should contain two files, open-logic-sample.tex and open-logic-sample-config.sty. You may rename these files, e.g., to myversion.tex, myversion-config.sty (where "myversion" can be any string). You can make any changes to the layout, fonts, page style, etc., in myversion.tex you like. You can also rearrange the order of the parts and chapters or leave out parts you do not want included. For instance, to exclude the part on computability theory, change the line

\olimport[computability]{computability}

to

%\olimport[computability]{computability}

in myversion.tex.

To change the OLT-specific configurations, e.g., how formulas are printed or whether formulas are called "formulas", "formulae", or "wffs", open myversion-config.sty in a text editor. The configuration options are explained in open-logic-config.sty in the main directory. Copy any configuration option you would like to change to myversion-config.sty and make your changes.

Finally, generate a PDF of your custom textbook by compiling the myversion.tex file with pdflatex.

You can keep different versions of the text in different directories by following the same steps as before.
Open Logic Project Special LaTeX Syntax

The Open Logic Book is configurable, you can choose which word you want the book to use for a number of technical terms, and more! To achieve this we preface configurable elements with a special syntax in the .tex files of book chapters. This makes writing chapters for the text a bit more complicated that it would have otherwise been, but not by too much. In addition to this section, you will have to read the open-logic-config.tex file in the top level of the OpenLogic repository, which contains a complete listing and explanation of the syntax.

The pattern common to all of the special syntax is that instead of using the standard LaTeX macros for a particular symbol, you use a specific Open Logic Project macro, e.g., \lif for a conditional symbol instead of \rightarrow. When the document is compiled, the special macro is replaced with text according to the configuration of that instance of the book. Sometimes the OLP uses the standard macro, e.g., \land. For example, one of the configuration options allows you to choose between the Greek and Latin alphabets for the symbols used to represent formula metavariables. For this to work, when you write material for the book you must use the syntax !A, !B, and so on for formula metavariables. Other configurable things include the symbols used for various sets of numbers (natural, real, integer, and so on), logical connectives (including quantifiers), and the syntax for relations like provability and entailment.

"Tokens" are slightly different than the rest of the configurable syntax. The idea is that in addition to using different symbols for the same thing across book instances, we might also want to use different words. This is done by treating some words, like "formula" and "variable" differently, as Tokens. When you use a tokenized word in material for the Open Logic book, instead of typing it, you have to enclose it in braces and place two exclamation points in front of it. That is, instead of typing

formula

type

!!{formula}

instead. To typeset the (configurable) plural form of a token word, type

!!{formula}s

and to typeset the token word with a (configurable) article, type

!!a{formula}

The complete list of tokenized words and instructions for customizing tokens can be found in the configuration file open-logic-config.tex
Pages 18

Home
Compiling OLT
Configuration File
Contributing
Conversion Options
Deferring Problems
Downloading OLT
Formulas
Git
LaTeX
LaTeX Features Packages Conversion Requirements
License
Open Logic Quick Start Guide

    Installing LaTeX and Git
    Linux
    Windows
    OSX
    Git Primer: "Fork" and Other Verbs
    Building the Open Logic Book
    Open Logic Project Special LaTeX Syntax

Other Logic Textbooks
Referencing
Clone this wiki locally
Footer


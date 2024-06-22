# Contributing

## How to Help Out

You can contribute to OLP in a number of ways:

- Provide feedback (requests, suggestions for improvement, typos)
- Improve existing content
- Contribute new content
  + Homework problems
  + Examples
  + Additional sections in existing topics
  + Additional/alternative explanations
  + Entirely new topics to cover

To provide feedback, please [fill an issue](https://github.com/OpenLogicProject/OpenLogic/issues). We welcome suggestions for what to cover, how to cover it, what functionality to provide, as well as being alerted to mistakes!

The preferred method for improving existing code or contributing new code is via a pull request (see below). If that seems like too much hassle, you can also file an issue with your code attached as a [LaTeX](./latex.md) file. The closer it is to our coding conventions, the more likely it is to be included in the project.

Can't be bothered to sign up for a GitHub account? That's ok. Just send your question, suggestion, or file to [info@openlogicproject.org](mailto:info@openlogicproject.org)

## Fork and Pull

We use the "fork & pull" model of contribution. In order to use it, you will have to use [Git](./git.md) yourself. In this model of contribution, you work on your own copy of the OLP texts (your "fork"). Git helps you keep your fork synchronized with changes in the official OLP version, but allows you to add things or make changes. When you're happy with your changes, you can send a "pull request", which essentially says "Hey, I've made some changes to a copy of your stuff, have a look, and incorporate those changes into your version if you like them". This makes it easy for the editors to maintain the integrity and quality of project, but also for contributors to add, change, and test content or code, and then nominate it for inclusion in the official repository of the Open Logic text.

### Fork the Repository

If you're logged in to Github and looking at the [main OLP repository page](https://github.com/OpenLogicProject/OpenLogic), you'll see a "Fork" button in the top right corner of the page. If you click this, github will create a complete copy of the OLP git repository in your own account. You will have complete control over that, including "push" access, i.e., you can push changes on your local copy to github.

### Clone your Fork

The repository view of your fork of OLP has a form field containing the clone URL of your fork. Copy this URL (it'll be something like [https://github.com/yourgitubid/OpenLogic.git](https://github.com/yourgitubid/OpenLogic.git)). Using this URL, you can "clone" your forked repository on your home machine with the command
```bash
git clone https://github.com/yourgitubid/OpenLogic.git
```
You should also tell your local git repository where you forked OLP from. Do this with the command
```bash
git remote add upstream https://github.com/OpenLogicProject/OpenLogic
```

### Work on Your Contribution

Suppose you want to add a section or chapter to OLP. You should do this in a "feature branch" that identifies the contribution you're making. E.g.,
```bash
git checkout -b FancyLogic
```
You could now add sections on fancy logic to the `FancyLogic` branch of your fork of OLP.

If you're not planning to make significant changes, e.g., if all you want is to correct an error in an existing file, you can skip the branch stuff and just edit the file directly.

You can commit your changes to your local repository with
```bash
git commit -a
```
To keep your repository up-to-date with changes made in the original OLP repository, you can merge these changes into your own forked copy with
```bash
git pull upstream master
```
You should do this at the latest before issuing a pull request, to make sure the differences between your forked copy and the official repository consists just in your additions or changes and not in additions or changes made to the official repository not yet included in your forked copy.

Make sure that the files in your fork compile without errors!

You should of course also push changes of your local forked copy to your forked copy of OLP on github with
```bash
git push
```

### Pull Request

When you're happy with your contribution and you want the OLP editors to have a look, and perhaps include some or all of your changes in the official OLP repository, you can click on the "compare" button on github's repository viewer. It will display a summary of differences between the official repository and your forked copy. Enter a title and leave a comment describing your changes and press "Send pull request".

GitHub will first of all compile the complete text with your changes. If it compiles ok, the pull request will say that "all checks have passed." Then an editor will look at your changes. They will either

1. just include ("merge") your changes into the main repository, or
2. ask you to change something
3. explain why your proposed change can't or won't be included

In the second case, you can then make additional changes in your local copy of your fork, and again use the `push` command to send them to your fork on GitHub. This will automatically update your pull request.
See also

- [https://www.atlassian.com/git/workflows#!workflow-forking](https://www.atlassian.com/git/workflows#!workflow-forking)
- [https://help.github.com/articles/using-pull-requests](https://help.github.com/articles/using-pull-requests)


.. _usage:

Using Gitsync
=============

Setting Up the Commit Template
------------------------------

To use the TimeSync commit template in your local repository, first grab a
copy of the template.

If you already have a copy of the template:

    ::

        $ cp /path/to/template .

If you haven't downloaded a copy of the template yet:

    ::

        $ wget https://raw.githubusercontent.com/osuosl/gitsync/master/git-commit-template

If the template hasn't yet been added to the ``.gitignore``, add the following
lines:

    ::

        # TimeSync commit template
        git-commit-template

To use the template in your commit messages, run this command:

    ::

        $ git config commit.template git-commit-template

To stop using the template, run this command:

    ::

        $ git config --unset commit.template

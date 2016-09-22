# gitsync

Timesync github integration

## Getting Started


### Setting up `gitsync`

Content pending...


### Building Docs

Gitsyncs docs are [Sphinx Docs][SPHINX_DOCS].  Build them by creating a Python
Virtualenv, installing the build dependencies, running `make html` and opening
the contents of `docs/build/html/` in your browser.

Build the docs:

```
$ cd docs
docs/ $ virtualenv venv
docs/ $ pip install -r requirements.txt
docs/ $ make html
```

Read the docs:

```
docs/ $ <browser> build/html/index.html
-- or --
docs/ $ pushd build/html && python2 -m SimpleHTTPServer ; popd
Serving HTTP on 0.0.0.0 port 8000 ...
```

Go to `localhost:8000` in your browser to see read the docs. Press `Ctrl+C` to
stop the command and return to the `docs/` directory.

[SPHINX_DOCS]: http://www.sphinx-doc.org/en/stable/

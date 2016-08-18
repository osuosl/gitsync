.. _design:

Design Documentation for Gitsync
================================

.. contents::

Introduction
------------

Gitsync is a github module for Timesync. It is based on `webhooks`_. The webhook
listens for a `push event`_, then sends all the push metadata to payload URL
of your choice. Gitsync then takes commit metadata out of that, parses the
necessary information, then sends it off to `Rimesync`_ to be sent to TimeSync.

.. _webhooks: https://developer.github.com/webhooks/
.. _push event: https://developer.github.com/v3/activity/events/types/#pushevent
.. _Rimesync: https://github.com/osuosl/rimesync/tree/develop

Time Information
----------------

The information to create a new time will come from the following sources:

* Duration: commit[message] - duration
* User: commit[author]
* Project: commit[url]
* Activities: commit[message] - activities
* Date Worked: commit[timestamp]
* Issue URI: commit[message] - issue uri, or we may be able to get this out of the
* push info somehow
* Notes: commit[message] - message, the commit message itself

Commit Template
---------------
The information not contained in the metadata itself will need to be entered
manually. A template for the commits will make this much easier, and should
follow the following format:

    * <commit message> - The commit message itself
    * Duration: <time> - How long the commit was worked on
    * Activities: <list of activities> - Things that were worked on in the commit.
    * This may have a default setting, probably "code".
    * Issue: <issue uri> - The URI for the issue that the commit is related to. This
    * may not be necessary if this information can be pulled from the metadata.

Example Commit
++++++++++++++

    | Wrote the design docs

    | Duration: .5 hr
    | Activities: docs
    | Issue: https://github.com/osuosl/gitsync/issues/4

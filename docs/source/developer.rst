.. _developer:

Developer Documentation for Gitsync
===================================

Introduction
------------

Gitsync is a ruby script that serves as a middleman between Github and Rimesync.
It uses Sinatra to recieve the information that Github sends to it via webhooks.

Setting Up the Ruby Server
--------------------------

Gitsync does not have a required ruby version, however Rimesync requires Ruby
2.2.1. Gitsync requires Sinatra. Sinatra recommends thin as well, though that
might not be necessary. Using `RVM`_ is recommended to avoid needing to mess
with things too much. Once your ruby version is correct:

    ::

        $ gem install sinatra
        $ gem install thin

Once those have installed, it is easy to start the server:

    ::

        $ ruby server.rb

Once the webhook is set up correctly, the server should recieve the information.

.. _RVM: https://rvm.io/rvm/install

Setting Up the Webhook
----------------------

The "curl_post" script is used for testing. It simulates getting a commit from
Github with the information that is required for a valid time. While the server
is running, run

    ::
        $ ./curl_post


If you want to get data directly from Github, you can also use `ngrok`_ to
expose a port on localhost to the internet.

1. Once ngrok is installed, run 

    :: 

        $ ./ngrok http 4567
        [info]
        Forwarding                    http://7503cd2e.ngrok.io -> localhost:4567
        [info]

2. Copy the .ngrok.io url from the resulting output
3. Navigate to Settings->Webhooks & services for the repository you wish to have
   a webhook.
4. Add a webhook.
5. Paste the url into the Payload URL field, appending "/payload" to the end.
6. Save the webhook.

.. note::
    ngrok generates a new url every time it is run, so the webhook will need to be
    updated every time it's restarted.

.. _ngrok: https://ngrok.com/download

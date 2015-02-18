znc
===

This is  a simple Dockerfile that you could use for hosting your own
irc bouncer a la `znc`_.

Build
-----

Building an image form this Dockerfile is pretty straightforward

.. code-block:: bash

    $ docker build -t crd0/znc:0.0.1 https://raw.githubusercontent.com/cdarwin/znc/master/Dockerfile

Data
----

If you prefer using a dedicated data only volume container for things 
like certs and configs, you might do so with the image you previously 
created like this.

.. code-block:: bash

    $ docker create -v /var/run/ircd --name zncdata crd0/znc:0.0.1 echo "data only volume container"

If this is your first time using this image, you might want to generate
a simple certificate into the persistent storage you just created.

.. code-block:: bash

    $ docker run --rm --volumes-from zncdata crd0/znc:0.0.1 /usr/bin/znc -p -d /var/run/ircd

Similarly, if you need to generate a config, you might do so interactively
using the same image.

.. code-block:: bash

    $ docker run --rm -it --volumes-from zncdata crd0/znc:0.0.1 /usr/bin/znc --makeconf -d /var/run/ircd

Alternatively, if you already have a recent backup your own the znc
data, you might restore it with something like the following:

.. code-block:: bash

    $ docker run --rm --volumes-from zncdata -v $(pwd):/backup crd0/znc:0.0.1 tar xvf /backup/backup.tar

Service
-------

Once all of my configs and such are as I expect them to be, I might use
something like the following to start the service in the background
with the default `CMD`

.. code-block:: bash

    $ docker run -d --volumes-from zncdata --name znc -p 36667:6667 crd0/znc:0.0.1

.. _znc: http://wiki.znc.in/ZNC

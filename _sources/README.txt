pyf
===

Python fluid properties

Motivation
----------

Fluid properties are notoriously hard to come across in literature. The
handbook Yaws is unweildy (although exhaustive), and has some
questionable assumptions. In general, nobody makes an interface to just
*simply return* the fluid value you are looking for. This was most
apparent to me, when working on a Drift Flux Model for a nuclear reactor
simulation, I asked a student working in thermal hydraulics for his
method to get the fluid properties of water. He gave me an excel
spreadsheet with a macro and about 15 pages on how to use it. It
shouldn't be that hard.

The current code should be possible to use like this:

.. code:: python


    >>> import pyf
    >>> dfp = pyf.fluid('decafluoropentane')
    >>> dfp.rho() # Get the density at 25 deg C and 1 atm (STP) in g/cc
    1578.7224589737573
    >>> dfp.rho(T=313.15) # Get the density at 40 deg C in g/cc
    1533.2408437717631
    >>> dfp.rho(P=202650) # Get the density at 2 atm in g/cc
    1578.9770785342776
    >>> dfp.sigma() # Get the surface tension at STP in dynes/cm
    14.1
    >>> dfp.c_p() # Get the specific heat at 20 deg C in kJ/kg/deg C
    1.13

Installation
------------

This isn't fully packaged yet, so installation is a little bit of a
hassle. To get the code, I suggest you first make a folder in your home
directory to hold utilities like this.

.. code:: bash


    $ mkdir ~/util

If you plan to do work developing the code, maybe you should put it in a
differently named folder, wherever you program from, such as ``code``.

.. code:: bash


    $mkdir ~/code

Then, grab the python from my ``github`` with

.. code:: bash

    $ cd ~/util
    $ git clone https://github.com/alexhagen/pyf
    Cloning into 'pyf'...
    remote: Counting objects: 4, done.
    remote: Compressing objects: 100% (3/3), done.
    remote: Total 4 (delta 0), reused 0 (delta 0), pack-reused 0
    Unpacking objects: 100% (4/4), done.
    Checking connectivity... done.

Finally, we need to make that folder available to our system. This can
be done one of two ways. The first is to add a line to your bashrc or
equivalent which opens up ``~/code`` or ``~/util`` to your python path.
This can be done with

.. code:: bash


    $ sudo echo "export PYTHONPATH=${PYTHONPATH}:~/util" >> ~/.bashrc

Note that if you're on a login shell, you may have to copy this to the
file ``.bash_profile``. To get this to work, you'll have to restart your
shell, or type

.. code:: bash


    $ source ~/.bashrc

You could also just do this every time you start a script by putting the
following lines at the top of each of your python scripts.

.. code:: python


    import sys
    from os.path import expanduser
    sys.path.append(expanduser("~") + "/util")
    # Now you can import pyf
    import pyf


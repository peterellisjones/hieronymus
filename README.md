![Portrait of Hieronymus Bosch](http://i.imgur.com/MV47cvm.gif)

Hieronymus
==========

Meteor-based GUI for [BOSH](https://github.com/cloudfoundry/bosh) command `bosh vms`. Created with [Craig Furman](https://github.com/craigfurman) as part of the [Pivotal Labs](http://pivotallabs.com/) Hackday May 2014.

If you have a publicly accessible BOSH director and aren't too concerned about security, you can use this app at [hieronymus.meteor.com](http://hieronymus.meteor.com). Otherwise, see below for instructions on how to serve this app locally.

## Screenshots

![login screenshot](http://i.imgur.com/twrH9vg.png)

![vms screenshot](http://i.imgur.com/9dpgy8o.png)

## Getting started

Make sure you have npm and meteorite installed

    $ brew install npm
    
    $ npm -g install meteorite
    
Install meteor with the script from the [site](http://meteor.com)

    $ curl https://install.meteor.com/ | sh
    
CD into the repo and run mrt

    $ git clone https://github.com/peterellisjones/hieronymus
    $ cd hieronymus
    $ NODE_TLS_REJECT_UNAUTHORIZED=0 mrt
    
NODE_TLS_REJECT_UNAUTHORIZED=0 is required if your BOSH director uses self-signed certificates
    
You should now see hieronymus at [localhost:3000](http://localhost:3000)

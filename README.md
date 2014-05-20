![Portrait of Hieronymus Bosch](http://i.imgur.com/MV47cvm.gif)

hieronymus
==========

Meteor-based GUI for [BOSH](https://github.com/cloudfoundry/bosh) command `bosh vms`

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
    
(NODE_TLS_REJECT_UNAUTHORIZED=0 is needed if your BOSH director uses self-signed certificates)
    
You should now see hieronymus at [localhost:3000](http://localhost:3000)

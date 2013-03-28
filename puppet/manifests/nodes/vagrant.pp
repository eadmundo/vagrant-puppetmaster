#
# Standalone manifest - for dev Vagrant box.
#
node vagrant {

  include vagrant
  include vagrant::puppet

}

node 'puppet' inherits vagrant {

    include puppetmaster

}

node slave inherits vagrant {

    include puppetslave

}

node 'puppetslave.vagrant' inherits slave {

}

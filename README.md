## Puppet module: SublimeText2 and plugins

Written by Alister Bulman, abulman@gmail.com

Official site & Git repo: http://github.com/alister/puppet-sublimetext2

Released under the terms of Apache 2 License.

### USAGE - Basic management

* Install sublime-text-2 with the given (required!) settings

    class { sublimetext2::params: 
      userName => 'alister',  # me, on Ubuntu 12.04
      installBasePath => "/home/alister/.config/sublime-text-2/Packages"
    }
    class { sublimetext": }

### USAGE - Overrides and Customizations

Install to a given path, and then add a plugin 

    # these must be set
    class { sublimetext2::params:
      userName        => 'alister',
      installBasePath => "/home/alister/.config/sublime-text-2/Packages"
      # @TODO given the userName, and the OS, we could probably work out the 
      # installBasePath in ::params ??
    }
    # also required (currently installs the dev package from a PPA)
    include sublimetext2
      sublimetext2::plugin { 'DocBlockr':
      gitUrl  => 'https://github.com/spadgos/sublime-jsdocs.git'
    }
    # could probably install PackageManager in much the same way.

See also my own [puppet manifests][1]

[1]: https://github.com/alister/puppet-ab/blob/master/modules/basesw/manifests/alister/sublimetext2.pp

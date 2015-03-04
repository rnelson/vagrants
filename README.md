# FreeBSD 10.1-RELEASE amd64

## About

Every time I start a new project with someone else, which happens fairly often
at local hackathons, I set up a new [Vagrant] environment to work out of. This
allows me to have complete control over the environment that everyone works in,
ensuring that we're all using the same version of everything and removing the
requirement that everyone install a bunch of stuff on their laptops to work on
the project.

The problem with this is that I spend _forever_ getting the environment set up
each time. At a recent (at time of writing) hackathon, I spent about 3 hours
(out of 5 total) just setting up the environment. The boxes I had used in the
past were unavailable now so all of my configuration had to change.
Additionally, while I'm familiar with Linux, I generally prefer [FreeBSD], so I
had to look up a lot of administration commands.

To simplify environment setup, I've created two repositories:

+ [vagrants](https://github.com/rnelson/vagrants), with Vagrant configs
+ [rsetup](https://github.com/rnelson/rsetup/tree/freebsd-10.1), with scripts to ease setting up extra software

## Usage

To use this, simply add this branch as a submodule (be sure to commit the
`.gitmodules` file) and creates a `vm.sh` with initialization commands. For
example:

```
proj$ git init
proj$ git submodule add -b freebsd-10.1-amd64 --name vagrant https://github.com/rnelson/vagrants.git vagrant
proj$ cp vagrant/vm.rb.example vm.rb
proj$ vi vm.rb
proj$ cd vagrant
proj/vagrant$ vagrant up
proj/vagrant$ vagrant ssh
```

`vm.rb` needs to contain class `VagrantConfig` with method `configure(config)`.
If `vm.rb` is found in the parent folder, it will look for class `VagrantConfig`
and call its `#configure`. The method takes a single argument, the config object
from Vagrant. This allows you to specify any Vagrant configuration options you
wish.

See [this commit](https://bitbucket.org/rossnelson/localomaha/commits/8f3aa5bb88a90b1c4e7b505ec0c7c82a13d04a1a)
as a real-world example of implementing this project.

## Bugs

SSH sessions time out at the moment. May just be a keepalive setting, may be
more.

Putting the host to sleep breaks the VM. Use `vagrant halt` to shut it down
before putting your system to sleep.

[Vagrant]: http://vagrantup.com
[FreeBSD]: http://freebsd.org
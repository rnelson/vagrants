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
+ [rsetup](https://github.com/rnelson/rsetup), with scripts to ease setting up extra software

## Usage

To use this, simply add this branch as a submodule (be sure to commit the
`.gitmodules` file) and creates a `vm.sh` with initialization commands. For
example:

```
proj$ git init
proj$ git submodule add -b freebsd-10.1-amd64 --name vagrant https://github.com/rnelson/vagrants.git vagrant
proj$ cat > vm.sh <<EOF
> #!/bin/sh
> /usr/local/bin/rsetup python3
> EOF
proj$ cd vagrant
proj/vagrant$ vagrant up
proj/vagrant$ vagrant ssh
```

This will set up a Vagrant VM with FreeBSD 10.1/amd64 and install Python 3.

[Vagrant]: http://vagrantup.com
[FreeBSD]: http://freebsd.org
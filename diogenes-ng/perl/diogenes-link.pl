#!/usr/bin/perl -w

# This script can be linked to in order to run the Diogenes
# command-line interface from a directory other than its own.  E.g.:
# ln -s /path/to/this/dir/diogenes-link.pl /usr/local/bin/dio

# This is necessary to avoid the pain of installing the Diogenes
# modules somewhere in the Perl path.  A cleaner alternative, which
# would produce a relocatable script, would be to use PAR like so:
#   system "pp -P -a Diogenes.map -o dio diogenes-cli.pl" and die $!;
# but when I tried the resulting script on OS X it failed.

# This is an ugly hack, but it seems to work on both Linux and OS X.

use strict;
use File::Basename;

my $path = $0;
my $level = 0;
while (-l $path)
{   
    $path = readlink $path;
    die "Error following symlink: $!" unless defined $path;
    die "Circular link!" if $level > 20;
}
my $dir = dirname($path);

chdir $dir;

exec "perl", "./diogenes-cli.pl", @ARGV;

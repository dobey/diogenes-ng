#!/usr/bin/perl -w
use strict;
my $DEBUG = 1;

use FindBin qw($Bin);
use File::Spec::Functions qw(:ALL);
use lib ($Bin, catdir($Bin,'CPAN') );


use Diogenes::Base;
my $runtime_dir = $ENV{XDG_RUNTIME_DIR};
my $lock_file = File::Spec->catfile($runtime_dir, 'diogenes-ng.run');

print "Running diogenes-server-kill.pl\n";

if (-e $lock_file)
{
    open LOCK, "<$lock_file" or warn "Could not open lock file: $!";
    my $pid;
    while (<LOCK>)
    {
        if (/^pid (.*)$/)
        {
            $pid = $1;
            last;
        }
    }
    close LOCK;
    print "Lock file exists, pid: $pid\n";
    if (not kill 0, $pid)
    {
        print "Process $pid does not exist\n";
        unlink($lock_file) or die $!;
    }
    else
    {
        kill 9, $pid;
        unlink($lock_file) or die $!;
        print "Killed $pid.\n"
    }
}
print "diogenes-server-kill.pl exiting.\n";

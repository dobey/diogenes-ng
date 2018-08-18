#!/usr/bin/perl -w
use strict;

my $install_prefix = '/usr/local';
my $install_dir = $install_prefix . '/diogenes-ng';
my $install_bin = $install_prefix . '/bin';
my $applications = '/usr/share/applications';
my $icon_dir = '/usr/share/pixmaps/';


print "\nGoing to install Diogenes in $install_dir and $install_bin.\n",
    "Supply your password (for sudo) if prompted.\n\n",
    "Ctrl-c to cancel, Enter to continue.\n";
<>;

for my $dir ($install_bin, $applications, $icon_dir)
{
    unless (-e $dir) {
        system "sudo mkdir -p $dir" and die $!;
    }
}
system "sudo rm -rf $install_dir" and die $!;

# system "sudo cp dio $install_bin/" and die $!;
system "sudo cp -a diogenes-ng $install_dir" and die $!;
system "sudo find $install_dir -name '*.xz' -exec unxz {} \\;" and die $!;
system "sudo ln -sf ${install_dir}/diogenes-ng /usr/local/bin/diogenes-ng" and die $!;

system "sudo cp diogenes-ng.desktop $applications" and die $!;
system "sudo cp diogenes.png $icon_dir" and die $!;


#!/usr/bin/perl -w
use strict;

my $id = $$;

my $URL = shift @ARGV;

if (@ARGV > 0) {
    my $repo = $URL;
    my $v = shift @ARGV;
    $URL = "https://github.com/$repo/archive/v$v.zip";
}

my $PACKDIR = "$ENV{HOME}/lib/swipl/pack";
my $TMPPACKDIR = "$PACKDIR-$id";

my $restore = "mv $TMPPACKDIR $PACKDIR";

print "CACHING TO: $TMPPACKDIR\n";
print `mv $PACKDIR $TMPPACKDIR`;
print "To restore, run: $restore\n\n";
runcmd("(echo 1 && echo Y && echo Y) | swipl -g \"(pack_install('$URL');writeln(failed)),halt.\"");
print `mv $PACKDIR $TMPPACKDIR.temp`;
runcmd($restore);
    
exit 0;

sub runcmd {
    my $cmd = shift;
    print STDERR "$cmd\n";
    print `$cmd`;
}
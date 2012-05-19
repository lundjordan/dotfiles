use strict;
use vars qw($VERSION %IRSSI);

$VERSION = '1.0';
%IRSSI = (
    authors     => 'Gavin Sharp',
    contact     => 'gavin@gavinsharp.com',
    name        => 'rememberpass',
    description => 'Automatically updates saved channel keys in response to mode changes.',
    license     => 'Public Domain',
    url         => 'http://gavinsharp.com/scripts/',
    changed     => 'Sun 15 Mar 2009 15:05:28 EDT',
);

sub rememberpass_mode_changed {
  my ($server,$args,$nick,$addr)=@_;
  my ($target,$modes,$modeparms)=split(" ",$args,3);

  # ignore non-k mode changes
  return if ($modes !~ /k/);

  # and non-channel targets
  return if ($target !~ /^#/);

  my $channel = $server->channel_find($target);

  # couldn't find channel, or channel has no key
  return if (!$channel || !$channel->{key});

  # ugly hack - check to see whether this channel is saved in the config
  my $save = `grep -i -c -m1 '$channel->{name}' ~/.irssi/config`;
  if ($save == 1) {
    Irssi::print(sprintf("Updating key for %s on %s. New key is '%s'.", $channel->{name}, $server->{chatnet}, $channel->{key}));
    Irssi::command(sprintf("channel add -auto %s %s %s", $channel->{name}, $server->{chatnet}, $channel->{key}));
  }
}

Irssi::signal_add_last("event mode", "rememberpass_mode_changed");

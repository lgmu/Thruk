package Monitoring::Config::Object::Realm;

use warnings;
use strict;

use parent 'Monitoring::Config::Object::Parent';

=head1 NAME

Monitoring::Config::Object::Realm - Shinken realm Object Configuration

=head1 DESCRIPTION

Defaults for realm objects

=cut

##########################################################

$Monitoring::Config::Object::Realm::Defaults = {
    'name'                            => { type => 'STRING', cat => 'Extended' },
    'use'                             => { type => 'LIST', link => 'realm', cat => 'Basic' },
    'register'                        => { type => 'BOOL', cat => 'Extended' },

    #'id'                              => { type => 'INT', cat => 'Basic' },
    'realm_name'                      => { type => 'STRING', cat => 'Basic' },
    'realm_members'                   => { type => 'STRING', cat => 'Basic' },
    #'higher_realms'                   => { type => 'STRING', cat => 'Basic' },
    'default'                         => { type => 'BOOL', cat => 'Basic' },
    'broker_complete_links'           => { type => 'BOOL', cat => 'Basic' },
};

##########################################################

=head1 METHODS

=head2 BUILD

return new object

=cut
sub BUILD {
    my $class    = shift || __PACKAGE__;
    my $coretype = shift;

    return unless($coretype eq 'any' or $coretype eq 'shinken');

    my $self = {
        'type'        => 'realm',
        'primary_key' => 'realm_name',
        'default'     => $Monitoring::Config::Object::Realm::Defaults,
        'standard'    => [ 'realm_name', 'realm_members', 'default', 'broker_complete_links' ],
    };
    bless $self, $class;
    return $self;
}

##########################################################

1;

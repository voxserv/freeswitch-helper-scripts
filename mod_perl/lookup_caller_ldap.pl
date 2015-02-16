use strict;
use warnings;
use Net::LDAP;

our $session;

# This script looks up the caller ID in LDAP and stores the
# contact name as effective_caller_id_name.
# The LDAP connection details are hardcoded for the sake of speed.



if( not defined($session) )
{
    die("this script must be run from freeswitch mod_perl");
}


fprint('Started lookup_caller_ldap.pl');

lookup_caller();

fprint('Finished lookup_caller_ldap.pl');

## END ##


sub lookup_caller
{
    my $caller = $session->getVariable('caller_id_number');

    my $ldap = Net::LDAP->new('ldap.domain.com', timeout => 1);
    if( not defined($ldap) )
    {
        ferror("Cannot create LDAP session: $@");
        return;
    }
    
    my $mesg = $ldap->bind;    # anonymous bind
    if( $mesg->code )
    {
        ferror("Cannot bind to LDAP server: " . $mesg->error);
        return;
    }    

    fprint('Searching ' . $caller . ' in LDAP');
    
    my $res = $ldap->search
        ( 
          base   => 'dc=domain,dc=com',
          sizelimit => 1,
          timelimit => 1,
          filter => '(phone=' . $caller . ')'
        );

    if( $res->code )
    {
        ferror("Error searching LDAP server: " . $res->error);
        return;
    }

    if( $res->count() )
    {
        my $name = $res->entry(0)->get_value('DisplayName');
        fprint('Found ' . $caller . ' in LDAP: ' . $name);
        $session->setVariable('effective_caller_id_name', $name);
    }
    else
    {
        fprint('Did not find ' . $caller . ' in LDAP');
    }
        
    return;
}
    




sub fprint
{
    my ($msg) = @_;
    freeswitch::consoleLog("INFO",$msg . "\n");
    return;
}

sub ferror
{
    my ($msg) = @_;
    freeswitch::consoleLog("ERROR", 'lookup_caller_ldap.pl: ' . $msg . "\n");
    return;
}


1;

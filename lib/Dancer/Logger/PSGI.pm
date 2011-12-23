package Dancer::Logger::PSGI;

use strict;
use warnings;
use Dancer::SharedData;
use base "Dancer::Logger::Abstract";

our $VERSION = '0.020_001'; # VERSION
# ABSTRACT: PSGI Log handler for Dancer

sub init {}

sub _log {
    my ( $self, $level, $message ) = @_;
    my $full_message = $self->format_message($level => $message);
    chomp $full_message;

    my $request = Dancer::SharedData->request;
    if ($request->{env}{"psgix.logger"}) {
        $request->{env}{"psgix.logger"}->(
            {   level   => $level,
                message => $full_message,
            }
        );
    }
    return;
}

1;


__END__
=pod

=head1 NAME

Dancer::Logger::PSGI - PSGI Log handler for Dancer

=head1 VERSION

version 0.020_001

=head1 SYNOPSIS

In your Dancer's configuration file:

    logger: PSGI

In your application

    warning "this is a warning"

Then, in your app.psgi

    $app = builder { enable "ConsoleLogger"; $app; }

or in your environment file:

    - plack_middlewares:
      - ConsoleLogger

With L<Plack::Middleware::ConsoleLogger>, all your log will be send to the JavaScript console of your browser.

=head1 DESCRIPTION

This class is an interface between your Dancer's application and B<psgix.logger>. Message will be logged in whatever logger you decided to use in your L<Plack> handler. If no logger is defined, nothing will be logged.

=head1 AUTHOR

franck cuny <franck@lumberjaph.net>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2011 by franck cuny.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut


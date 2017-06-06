package Data::MessagePack::Types;
use 5.008001;
use strict;
use warnings;
use Data::MessagePack;

use parent 'Exporter';
our @EXPORT = qw/msgpack_number msgpack_bool msgpack_string/;

our $VERSION = "0.01";

sub msgpack_number($) {
    return undef unless defined $_[0];
    $_[0] + 0;
}

sub msgpack_string($) {
    return undef unless defined $_[0];
    $_[0] . '';
}

sub msgpack_bool($) {
    $_[0] ? Data::MessagePack::true : Data::MessagePack::false;
}

1;
__END__

=encoding utf-8

=for stopwords MessagePack

=head1 NAME

Data::MessagePack::Types - Utility of value type for Data::MessagePack

=head1 STOP!!!

You B<DON'T> have to use this library. Don't worry, please use L<JSON::Types>. That library works correctly even if target is MessagePack.

=head1 LICENSE

Copyright (C) moznion.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

moznion E<lt>moznion@gmail.comE<gt>

=cut


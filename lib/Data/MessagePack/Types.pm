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

=for stopwords msgpack

=head1 NAME

Data::MessagePack::Types - Utility of value type for Data::MessagePack

=head1 SYNOPSIS

    use Data::MessagePack;
    use Data::MessagePack::Types;

    my $data = +{
        foo => msgpack_number "123", # <= force number type (i.e. 123)
        bar => msgpack_string 123, # <= force string type (i.e. '123')
        buz => msgpack_bool 1, # <= force boolean type (i.e. Data::MessagePack::true)
        qux => msgpack_bool 0, # <= force boolean type (i.e. Data::MessagePack::false)
    };

    my $mp = Data::MessagePack->new();
    my $packed = $mp->pack($data);

=head1 DESCRIPTION

Data::MessagePack::Types is an utility of value type for Data::MessagePack.

This package provides some functions to convert your type of values to be suitable to msgpack's one.

=head1 FUNCTIONS

=head2 C<msgpack_number($val): Number>

Force C<$val> to be number type. If C<$val> is C<'123'> that is string type, return value of this function will be C<123> that is a pure number (not a string).

This function is exported.

=head2 C<msgpack_string($val): String>

Force C<$val> to be string type. If C<$val> is C<123> that is number type, return value of this function will be C<'123'> that is a string (not a number).

This function is exported.

=head2 C<msgpack_bool($val): Data::MessagePack::Boolean>

Force C<$val> to be boolean type. If C<$val> is false value of perl (e.g. C<0>, C<undef>, C<''>), return value of this function will be C<Data::MessagePack::Boolean> that represents false. Conversely, if C<$val> is true value of perl, this function returns C<Data::MessagePack::Boolean> that represents true.

This function is exported.

=head1 NOTES

If C<prefer_integer> is set to instance of L<Data::MessagePack>, this package will be neutralized.

=head1 THANKS

This package is inspired by L<JSON::Types> and taken almost code from it.

=head1 SEE ALSO

=over 4

=item * L<Data::MessagePack>

=item * L<JSON::Types>

=back

=head1 LICENSE

Copyright (C) moznion.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

moznion E<lt>moznion@gmail.comE<gt>

=cut


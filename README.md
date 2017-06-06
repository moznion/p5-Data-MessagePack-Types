[![Build Status](https://travis-ci.org/moznion/p5-Data-MessagePack-Types.svg?branch=master)](https://travis-ci.org/moznion/p5-Data-MessagePack-Types)
# NAME

Data::MessagePack::Types - Utility of value type for Data::MessagePack

# SYNOPSIS

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

# DESCRIPTION

Data::MessagePack::Types is an utility of value type for Data::MessagePack.

This package provides some functions to convert your type of values to be suitable to msgpack's one.

# FUNCTIONS

## `msgpack_number($val): Number`

Force `$val` to be number type. If `$val` is `'123'` that is string type, return value of this function will be `123` that is a pure number (not a string).

This function is exported.

## `msgpack_string($val): String`

Force `$val` to be string type. If `$val` is `123` that is number type, return value of this function will be `'123'` that is a string (not a number).

This function is exported.

## `msgpack_bool($val): Data::MessagePack::Boolean`

Force `$val` to be boolean type. If `$val` is false value of perl (e.g. `0`, `undef`, `''`), return value of this function will be `Data::MessagePack::Boolean` that represents false. Conversely, if `$val` is true value of perl, this function returns `Data::MessagePack::Boolean` that represents true.

This function is exported.

# NOTES

If `prefer_integer` is set to instance of [Data::MessagePack](https://metacpan.org/pod/Data::MessagePack), this package will be neutralized.

# THANKS

This package is inspired by [JSON::Types](https://metacpan.org/pod/JSON::Types) and taken almost code from it.

# SEE ALSO

- [Data::MessagePack](https://metacpan.org/pod/Data::MessagePack)
- [JSON::Types](https://metacpan.org/pod/JSON::Types)

# LICENSE

Copyright (C) moznion.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

moznion <moznion@gmail.com>

use strict;
use warnings;
use utf8;
use Data::MessagePack;
use Data::MessagePack::Types;

use Test::More;

my $mp = Data::MessagePack->new;

subtest 'use msgpack_bool' => sub {
    subtest 'false value' => sub {
        subtest 'with false value' => sub {
            my $packed = $mp->pack(msgpack_bool 0);
            my $unpacked = $mp->unpack($packed);
            is $unpacked, Data::MessagePack::false;
        };

        subtest 'with undef' => sub {
            my $packed = $mp->pack(msgpack_bool undef);
            my $unpacked = $mp->unpack($packed);
            is $unpacked, Data::MessagePack::false;
        };
    };

    subtest 'true value' => sub {
        subtest 'with true value' => sub {
            my $packed = $mp->pack(msgpack_bool 1);
            my $unpacked = $mp->unpack($packed);
            is $unpacked, Data::MessagePack::true;
        };
    };
};

subtest 'not use msgpack_bool (control experiment)' => sub {
    subtest 'with false value' => sub {
        my $packed = $mp->pack(0);
        my $unpacked = $mp->unpack($packed);
        is $unpacked, 0;
    };

    subtest 'with true value' => sub {
        my $packed = $mp->pack(1);
        my $unpacked = $mp->unpack($packed);
        is $unpacked, 1;
    };
};

done_testing;


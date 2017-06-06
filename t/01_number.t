use strict;
use warnings;
use utf8;
use Data::MessagePack;
use Data::MessagePack::Types;

use Test::More;

my $mp = Data::MessagePack->new;

subtest 'use msgpack_number' => sub {
    subtest 'with normal value' => sub {
        my $packed = $mp->pack(msgpack_number '123');
        is $packed, chr(123), 'is packed as number';
    };

    subtest 'with undef' => sub {
        my $packed = $mp->pack(msgpack_number undef);
        my $unpacked = $mp->unpack($packed);
        is $unpacked, undef;
    };

    subtest 'with not num string (expects warn message)' => sub {
        my $is_warned = 0;

        $SIG{__WARN__} = sub {
            print "$_[0]\n";

            $is_warned++;
        };

        my $converted = msgpack_number 'STRING';

        ok $is_warned;
        is $converted, 0;
    };
};

subtest 'not use msgpack_number (control experiment)' => sub {
    my $packed = $mp->pack('123');
    my $header = chr(196) . chr(3);
    is $packed, "${header}123", 'is packed as string (binary)';
};

done_testing;


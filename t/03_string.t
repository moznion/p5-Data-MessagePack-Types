use strict;
use warnings;
use utf8;
use Data::MessagePack;
use Data::MessagePack::Types;
use File::Temp;

use Test::More;

my $mp = Data::MessagePack->new;

subtest 'use msgpack_string' => sub {
    subtest 'normal case' => sub {
        my $packed = $mp->pack(msgpack_string 123);
        my $header = chr(196) . chr(3);
        is $packed, "${header}123", 'is packed as string (binary)';
    };

    subtest 'with instance of any class' => sub {
        my $filetemp = File::Temp->new;

        my $packed = $mp->pack(msgpack_string $filetemp);

        my $filename = $filetemp->filename;
        ok $packed =~ /$filename\Z/, 'is packed as string (binary)';
    };

    subtest 'with undef' => sub {
        my $packed = $mp->pack(msgpack_string undef);
        my $unpacked = $mp->unpack($packed);
        is $unpacked, undef;
    };
};

subtest 'not use msgpack_string (control experiment)' => sub {
    my $packed = $mp->pack(123);
    is $packed, chr(123), 'is packed as number';
};

done_testing;


requires 'perl', '5.008001';
requires 'Exporter';
requires 'Data::MessagePack';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

on 'develop' => sub {
    requires 'Perl::Critic', '1.126';
    requires 'Test::Perl::Critic', '1.03';
};


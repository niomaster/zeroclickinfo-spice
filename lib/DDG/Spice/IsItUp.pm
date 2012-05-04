package DDG::Spice::IsItUp;

use DDG::Spice;

spice is_cached => 0;

triggers query_lc => qr/^(?:is\s|)([0-9a-z\-]+)(?:(\.[a-z]{2,4})|)\s(?:up|down|working)/;

spice to => 'http://isitup.org/$1.json?callback={{callback}}';

handle matches => sub {
    return $2 ? $1.$2 : $1.'.com';
    return;
};

1;


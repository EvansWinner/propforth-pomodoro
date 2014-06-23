fl

: flashdelay 50 ;
: dlyflash flashdelay delms ;
: pinoffset 16 + ;
: flashinit 8 0 do i pinoffset pinout loop ;
: flash dup pinoffset pinhi dlyflash pinoffset pinlo dlyflash ;
: flashup 8 0 do i flash loop ;
: alloff 24 15 do i pinlo loop ;
: flashall 24 16 do i pinhi loop dlyflash alloff dlyflash ;
: flashdown 8 0 do 7 i - flash loop ;
: flashpattern flashup 3 0 do flashall loop flashdown ;

: flashes begin flashpattern 0 until ;

: chunk 187 ; \ 1/8 of 25 min in seconds
: on pinoffset pinhi ;
: off pinoffset pinlo ;
: wait chunk 0 do i drop 1000 delms loop ;
: timer 8 0 do i on wait loop ;

: pomodoro flashinit timer alloff 1000 delms flashes ;

: onreset1 onreset 100 delms pomodoro ;

saveforth

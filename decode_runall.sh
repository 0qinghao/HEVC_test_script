#!/bin/bash

# SeqName=(BasketballPass )
# SeqName_alphabet_all=(BasketballDrill BlowingBubbles Cactus Kimono PartyScene SlideEditing Vidyo1 BasketballDrillText BQMall ChinaSpeed KristenAndSara PeopleOnStreet SlideShow Vidyo3 BasketballDrive BQSquare FourPeople RaceHorsesC Vidyo4 BasketballPass BQTerrace Johnny ParkScene RaceHorses Traffic)
# SeqName=(PeopleOnStreet Traffic BasketballDrive BQTerrace Cactus Kimono ParkScene BasketballDrill BQMall PartyScene RaceHorsesC BasketballPass BlowingBubbles BQSquare RaceHorses FourPeople Johnny KristenAndSara BasketballDrillText ChinaSpeed SlideEditing SlideShow)
SeqName=(PeopleOnStreet Traffic BasketballDrive BQTerrace Cactus Kimono ParkScene BasketballDrill BQMall PartyScene RaceHorsesC BasketballPass BlowingBubbles BQSquare RaceHorses FourPeople Johnny KristenAndSara Vidyo1 Vidyo3 Vidyo4 BasketballDrillText ChinaSpeed SlideEditing SlideShow)
# SeqName=(SlideEditing SlideShow FlyingGraphics)

basedir=`pwd`

test_time=1

if [ $test_time -eq 0 ]; then
    for i in "${!SeqName[@]}";
    do
    {
        echo "Decoding "${SeqName[$i]}
        cd $basedir/bin_HEVC
        ./TAppDecoderStatic -b ./${SeqName[$i]}.bin -o ${SeqName[$i]}_dec.yuv > ./${SeqName[$i]}_dec_HEVC.log &
        cd $basedir/bin_EI
        ./TAppDecoderStatic -b ./${SeqName[$i]}.bin -o ${SeqName[$i]}_dec.yuv > ./${SeqName[$i]}_dec_EI.log &
    }&
    done
else
    for i in "${!SeqName[@]}";
    {
        echo "Decoding "${SeqName[$i]}
        cd $basedir/bin_EI
        ./TAppDecoderStatic -b ./${SeqName[$i]}.bin -o ${SeqName[$i]}_dec.yuv > ./${SeqName[$i]}_dec_EI.log
        cd $basedir/bin_HEVC
        ./TAppDecoderStatic -b ./${SeqName[$i]}.bin -o ${SeqName[$i]}_dec.yuv > ./${SeqName[$i]}_dec_HEVC.log
    }
fi
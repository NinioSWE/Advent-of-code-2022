use strict;
use warnings;

my $file = 'input.txt';
open my $info, $file or die "Could not open $file: $!";
my $score = 0;

while(my $line = <$info>)  {   
    my @spl = split(' ', $line);
    my $hisHand = ord($spl[0]) - 64;
    my $myHand = ord($spl[1]) - 87;
    
    if($myHand - $hisHand % 3 == 1){
        $score += 6;
    }
    elsif($myHand == $hisHand) {
        $score += 3
    }
    else{
        $score += 0;
    }
    $score += $myHand;
}
print("first answer: " . $score. "\n");
close $info;

open my $info2, $file or die "Could not open $file: $!";
$score = 0;

while(my $line = <$info2>)  {   
    my @spl = split(' ', $line);
    my $hisHand = ord($spl[0]) - 64;
    my $wantedResult = ord($spl[1]) - 89;
    
    my $myhand2 = $hisHand + $wantedResult ;

    if($myhand2 == 0){
        $myhand2 = 3;
    }
    if($myhand2 == 4){
        $myhand2 = 1;
    }
    if($myhand2 - $hisHand % 3 == 1){
        $score += 6;
    }
    elsif($myhand2 == $hisHand) {
        $score += 3
    }
    else{
        $score += 0;
    }
    $score += $myhand2;
}
print("second answer: " . $score);
close $info2;


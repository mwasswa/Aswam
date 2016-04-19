<?php
$userInput = str_split($_GET['name']);
$wordOfWeek = str_split("qwerty");

$matches = 0;
foreach($userInput as $letter){
    if(in_array($letter,$wordOfWeek)){
        $matches++;
    }
}

if($matches >= 3){
    echo "Congs you have won the jackpot";
}else{
    echo "Unfaortunately youve failed. Try again later";
}
?>


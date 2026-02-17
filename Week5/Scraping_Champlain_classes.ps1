function gatherClasses(){

$page = Invoke-WebRequest -TimeoutSec 2 http://10.0.17.15/Courses2026SP.html

$trs=$page.ParsedHtml.body.getElementsByTagName("tr")

$FullTable = @()
for($i=1; $i -lt $trs.length; $i++){

    $tds = $trs[$i].getElementsByTagName("td")

    $Times = $tds[5].innerText.Split("-")

    $FullTable += [pscustomobject]@{"class code" = $tds[0].innertext;
                                    "Title"      = $tds[1].innertext;
                                    "Days"       = $tds[4].innertext;
                                    "Time Start" = $Times[0];
                                    "Time End"   = $Times[1];
                                    "Instructor" = $tds[6].innertext;
                                    "Location"   = $tds[9].innertext;
                                }
    }
    return $FullTable
}

function daysTranslator($FullTable){

    for($i=0; $i -lt $FullTable.length; $i++){
    
        $Days = @()

        if($FullTable[$i].Days -ilike "*M*"){ $Days += "Monday" }

        if($FullTable[$i].Days -ilike "*T[TWF]*"){ $Days += "Tuesday" }
        ElseIf($FullTable[$i].Days -ilike "*T*"){ $Days += "Tuesday" }

        if($FullTable[$i].Days -ilike "*W*"){ $Days += "Wednesday" }

        if($FullTable[$i].Days -ilike "*TH*"){ $Days += "Thursday" }

        if($FullTable[$i].Days -ilike "*F*"){ $Days += "Friday" }

        $FullTable[$i].Days = $Days
    }
    return $FullTable
}
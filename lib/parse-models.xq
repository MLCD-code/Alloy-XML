let $repo := 'file:///home/MLCD/Alloy-XML/',
    $tipdir := 'file:///home/mlcd.blackmesatech.com/mlcd/2020/W/tip/',
    
    $g := $repo || "grammar/Alloy-grammar.ixml",
    $models := ($tipdir || "Alloy/iron_model.als",
                $tipdir || "Alloy/multi-level-tt.als",
                $tipdir || "Alloy/multi-level-types-and-tokens.als",
                $tipdir || "Alloy/stammerings.als",
                $tipdir || "Alloy/straw.als",
                $tipdir || "Alloy/tin.als",
                $tipdir || "Alloy/tokens-and-marks.als",
                $tipdir || "Alloy/tokens-and-marks.1.als",
                $tipdir || "Alloy/wood.als" 
               )
               
let $parser := invisible-xml(unparsed-text($g)),
    $model := $models[1],
    $doc := $parser(unparsed-text($model))
    
return $doc
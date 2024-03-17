(: Assume character classes namestartchar and namechar,
   and identifier = namestartchar, namechar*.
   
   Given a set of keywords, define the language
   identifer \ keywords.
   :)

let $exclusion-form := ('exclusion', 'nonterminal')[1]

let $keywords := ("abstract", "all", "and", "as", "assert",
                  "but", 
                  "check", 
                  "disj",
                  "else", "exactly", "extends",
                  "fact", "for", "fun", 
                  "iden", "iff", "implies", "in", "Int", 
                  "let", "lone", 
                  "module", 
                  "no", "none", "not",
                  "one", "open", "or",
                  "pred", 
                  "run", 
                  "set", "sig", "some", "sum",
                  "univ"
                )
let $prefixes := distinct-values(
                   for $kw in $keywords
                   for $i in 1 to string-length($kw)
                   return substring($kw, 1, $i)
                 )
                 
return <rule name="name-minus-reserved-words">{
  
for $p in $prefixes
let $matches := $keywords[starts-with(., $p)],
    $suffixes := for $m in $matches return substring-after($m, $p),
    $chars := distinct-values(
                for $s in $suffixes
                return substring($s,1,1)
              )
return if (count($matches) eq 1
           and $matches eq $p)
       then (: $p is a reserved word and not a proper
               prefix of any other reserved word.  
               E.g. "and".
               Require more characters :)
         <alt>
           <literal string="{$p}"/>
           <repeat1>
             <nonterminal name="namechar"/>
           </repeat1>
         </alt>
       else if (count($suffixes) gt 1
                and 
                count($matches[. eq $p]) gt 0)
       then (: $p is a reserved word, and the prefix of 
               at least one other reserved word $q. E.g. "as".
               Require more characters, and make the first
               one differ from $q :)
         <alt>
           <literal string="{$p}"/>
           <exclusion>{
             for $c in $chars[. ne '']
             return <member string="{$c}"/>          
           }</exclusion>
           <repeat0>
             <nonterminal name="namechar"/>
           </repeat0>
         </alt>        
       else (: $p is not a reserved word, but is by
               construction the prefix of one or more
               reserved words $q.  Accept $p, or
               accept a long string different in
               the next position from $q. :)
         <alt>
           <literal string="{$p}"/>
           <option><alts><alt>
             <exclusion>{
               for $c in $chars
               return <member string="{$c}"/>
             }</exclusion>
             <repeat0>
               <nonterminal name="namechar"/>
             </repeat0>
           </alt></alts></option>
         </alt>

}</rule>
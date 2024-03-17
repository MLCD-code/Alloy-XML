module tour/addressBook1

sig Name, Addr {}

run { 
  simple_content 
  and no_sharing 
  and (some disj d1, d2: Document | t_similar[d1, d2] and some d1.content)
} for 3 but 2 Document, 4 Type, 8 Token


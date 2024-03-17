module tour/addressBook1

sig Name, Addr {}

pred no_sharing {
  all disj d1, d2: Document | elems[d1.content] & elems[d2.content] = none
}

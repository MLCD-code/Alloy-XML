module tour/addressBook1

sig Name, Addr {}
sig Book {
  addr: Name -> lone Addr
  }

/* from Jackson, chap. 2 */

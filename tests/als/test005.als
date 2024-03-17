module tour/addressBook1

sig Name, Addr {}
sig Book {
  addr: Name -> lone Addr
  }

fact { a => b => c else d }

fact { a => b else c => d => e else f => g => h }
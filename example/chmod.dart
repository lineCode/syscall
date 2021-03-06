import "package:syscall/syscall.dart";

void main() {
  var path = "test.sh";
  var fd = open(path, OpenFlags.CREATE | OpenFlags.READ_WRITE);
  var b = write(fd, '#!/usr/bin/env bash\necho "Hello World"');
  fsync(fd);
  close(fd);
  print("Wrote ${b} bytes.");
  chmod(path, FileModes.FULL_ANYONE);
}

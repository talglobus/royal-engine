# Package

version       = "0.1.0"
author        = "Tal Globus"
description   = "A game engine for the Royal Game of Ur"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["engine"]

backend       = "cpp"

# Dependencies

requires "nim >= 1.0.0"

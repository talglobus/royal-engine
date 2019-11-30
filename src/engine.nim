# This is just an example to get you started. A typical hybrid package
# uses this file as the main entry point of the application.

# import enginepkg/submodule
import enginepkg/control_state
import enginepkg/control_state_debug
# import os

when isMainModule:
  # echo paramCount(), " ", paramStr(0)
  let BLACK_ONLY = 0b0001'u8
  let RESTRICTED_ONLY = 0b0010'u8
  let ROSETTE_ONLY = 0b0100'u8
  let MULTI_ONLY = 0b1000'u8
  let NOT_BLACK_ONLY = 0b1110'u8
  let NOT_RESTRICTED_ONLY = 0b1101'u8
  let NOT_ROSETTE_ONLY = 0b1011'u8
  let NOT_MULTI_ONLY = 0b0111'u8
  let test = h
  echo not test.isWhite()
  echo test.isRestricted()
  echo test.isRosette()
  echo test.isMulti()
  
  # echo(getWelcomeMessage())

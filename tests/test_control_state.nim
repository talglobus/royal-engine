# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import enginepkg/control_state
import enginepkg/control_state_debug

suite "test suite for constructing control state":
  test "correct control state bitwise construction":
    check:
      getControlState(0) == 0b1101
      getControlState(1) == 0b1100
      getControlState(2) == 0b1100
      getControlState(3) == 0b1100
      getControlState(4) == 0b1110
      getControlState(5) == 0b0101
      getControlState(6) == 0b0100
      getControlState(7) == 0b0100
      getControlState(8) == 0b0100
      getControlState(9) == 0b0110
      getControlState(10) == 0b0000
      getControlState(11) == 0b0000
      getControlState(12) == 0b0000
      getControlState(13) == 0b0010
      getControlState(14) == 0b0000
      getControlState(15) == 0b0000
      getControlState(16) == 0b0000
      getControlState(17) == 0b0000
      getControlState(18) == 0b0100
      getControlState(19) == 0b0110
      getControlState(20) == 0b0101
      getControlState(21) == 0b1100
      getControlState(22) == 0b1110
      getControlState(23) == 0b1101

suite "test suite for interpreting control state":
  setup:
    const BLACK_ONLY = 0b1000
    const RESTRICTED_ONLY = 0b0100
    const ROSETTE_ONLY = 0b0010
    const MULTI_ONLY = 0b0001
    const NOT_BLACK_ONLY = 0b0111
    const NOT_RESTRICTED_ONLY = 0b1011
    const NOT_ROSETTE_ONLY = 0b1101
    const NOT_MULTI_ONLY = 0b1110

  test "black bit positive test":
    check:
      BLACK_ONLY.isWhite() == false                 # Black bit reversed because of negative (active low) assertion
      BLACK_ONLY.isRestricted() == false
      BLACK_ONLY.isRosette() == false
      BLACK_ONLY.isMulti() == false

  test "black bit negative test":
    check:
      NOT_BLACK_ONLY.isWhite() == true              # Black bit reversed because of negative (active low) assertion
      NOT_BLACK_ONLY.isRestricted() == true
      NOT_BLACK_ONLY.isRosette() == true
      NOT_BLACK_ONLY.isMulti() == true

  test "restricted bit positive test":
    check:
      RESTRICTED_ONLY.isWhite() == true             # Black bit reversed because of negative (active low) assertion
      RESTRICTED_ONLY.isRestricted() == true
      RESTRICTED_ONLY.isRosette() == false
      RESTRICTED_ONLY.isMulti() == false

  test "restricted bit negative test":
    check:
      NOT_RESTRICTED_ONLY.isWhite() == false        # Black bit reversed because of negative (active low) assertion
      NOT_RESTRICTED_ONLY.isRestricted() == false
      NOT_RESTRICTED_ONLY.isRosette() == true
      NOT_RESTRICTED_ONLY.isMulti() == true

  test "rosette bit positive test":
    check:
      ROSETTE_ONLY.isWhite() == true                # Black bit reversed because of negative (active low) assertion
      ROSETTE_ONLY.isRestricted() == false
      ROSETTE_ONLY.isRosette() == true
      ROSETTE_ONLY.isMulti() == false

  test "rosette bit negative test":
    check:
      NOT_ROSETTE_ONLY.isWhite() == false           # Black bit reversed because of negative (active low) assertion
      NOT_ROSETTE_ONLY.isRestricted() == true
      NOT_ROSETTE_ONLY.isRosette() == false
      NOT_ROSETTE_ONLY.isMulti() == true

  test "multi bit positive test":
    check:
      MULTI_ONLY.isWhite() == true                  # Black bit reversed because of negative (active low) assertion
      MULTI_ONLY.isRestricted() == false
      MULTI_ONLY.isRosette() == false
      MULTI_ONLY.isMulti() == true

  test "multi bit negative test":
    check:
      NOT_MULTI_ONLY.isWhite() == false             # Black bit reversed because of negative (active low) assertion
      NOT_MULTI_ONLY.isRestricted() == true
      NOT_MULTI_ONLY.isRosette() == true
      NOT_MULTI_ONLY.isMulti() == false

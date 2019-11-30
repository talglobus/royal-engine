# Source of truth for `ControlState` object format
const
    MULTI_BIT = 0
    ROSETTE_BIT = 1
    RESTRICTED_BIT = 2
    COLOR_BIT = 3
    SINGLE_BITVAL = 0
    MULTI_BITVAL = 1
    NOT_ROSETTE_BITVAL = 0
    IS_ROSETTE_BITVAL = 1
    NOT_RESTRICTED_BITVAL = 0
    IS_RESTRICTED_BITVAL = 1
    WHITE_BITVAL = 0
    BLACK_BITVAL = 1

type
    Index = range[0..23]
    ControlState* = uint8

let COLOR_BITMASK: uint8 = 1 shl COLOR_BIT
let RESTRICTED_BITMASK: uint8 = 1 shl RESTRICTED_BIT
let ROSETTE_BITMASK: uint8 = 1 shl ROSETTE_BIT
let MULTI_BITMASK: uint8 = 1 shl MULTI_BIT

# Source of truth for the values of the `controlState` for any given index
proc getControlState*(i: Index): ControlState =
    # TODO: See if replacing this with a lookup table would be worth it to get a bit more speed for space
    # Set color bit
    var controlState: ControlState
    if i >= 5 and i <= 20:
        controlState = controlState or (WHITE_BITVAL shl COLOR_BIT)
    else:
        controlState = controlState or (BLACK_BITVAL shl COLOR_BIT)
    # Set restricted bit
    if i >= 10 and i <= 17:
        controlState = controlState or (NOT_RESTRICTED_BITVAL shl RESTRICTED_BIT)
    else:
        controlState = controlState or (IS_RESTRICTED_BITVAL shl RESTRICTED_BIT)
    # Set multi bit
    if i in [0, 5, 20, 23]:
        controlState = controlState or (MULTI_BITVAL shl MULTI_BIT)
    else:
        controlState = controlState or (SINGLE_BITVAL shl MULTI_BIT)
    # Set rosette bit
    if i in [4, 9, 13, 19, 22]:
        controlState = controlState or (IS_ROSETTE_BITVAL shl ROSETTE_BIT)
    else:
        controlState = controlState or (NOT_ROSETTE_BITVAL shl ROSETTE_BIT)
    controlState

proc isWhite*(controlState: ControlState): bool =
    uint8((controlState and COLOR_BITMASK) shr COLOR_BIT) == WHITE_BITVAL


proc isRestricted*(controlState: ControlState): bool =
    uint8((controlState and RESTRICTED_BITMASK) shr RESTRICTED_BIT) == IS_RESTRICTED_BITVAL


proc isRosette*(controlState: ControlState): bool =
    uint8((controlState and ROSETTE_BITMASK) shr ROSETTE_BIT) == IS_ROSETTE_BITVAL


proc isMulti*(controlState: ControlState): bool =
    uint8((controlState and MULTI_BITMASK) shr MULTI_BIT) == MULTI_BITVAL

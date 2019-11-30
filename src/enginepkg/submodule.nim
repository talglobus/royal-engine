# This is just an example to get you started. Users of your hybrid library will
# import this file by writing ``import enginepkg/submodule``. Feel free to rename or
# remove this file altogether. You may create additional modules alongside
# this file as required.

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


import control_state
# import control_state_debug    # Either this or `control_state` should be imported, but not both
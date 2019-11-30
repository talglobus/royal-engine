import strutils
import control_state

proc `$`*(controlState: ControlState): string =
    return toBin(int(controlState), 4)
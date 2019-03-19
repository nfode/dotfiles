#!/usr/bin/env python3

import dbus
import sys

def kb_light_set():
    bus = dbus.SystemBus()
    kbd_backlight_proxy = bus.get_object('org.freedesktop.UPower', '/org/freedesktop/UPower/KbdBacklight')
    kbd_backlight = dbus.Interface(kbd_backlight_proxy, 'org.freedesktop.UPower.KbdBacklight')

    current = kbd_backlight.GetBrightness()
    maximum = kbd_backlight.GetMaxBrightness()
    if current == maximum:
        current = 0
    else:
        current = current + 1

    kbd_backlight.SetBrightness(current)
    print(current)

if __name__ ==  '__main__':
    kb_light_set()    


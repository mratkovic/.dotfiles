import hidapi
import os
import sys
from argparse import ArgumentParser

_UNIFYING_DRIVER = 'logitech-djreceiver'
_LOGITECH_VENDOR_ID = 0x046d

_OFF = '\x10\x01\t\x19\x00\x00\x00'
_ON = '\x10\x01\t\x18\x01\x00\x00'



def list_all_logitech_receivers():
    return list(hidapi.enumerate(vendor_id=_LOGITECH_VENDOR_ID, hid_driver=_UNIFYING_DRIVER))


def main(turn_on=False):
    all_recievers = list_all_logitech_receivers()
    if not all_recievers:
        print('Keyboard not found!! Could not continue')
        exit(2)

    id = 0
    if len(all_recievers) > 1:
        print('Multiple devices found')
        print('\n'.join(map(str, all_recievers)))

        id = raw_input('> Select index of correct keyboard')

    rawdevice = all_recievers[0]
    handle = hidapi.open_path(rawdevice.path)
    if not handle:
        print('Could not open device %s. Could not continue' % rawdevice.path)

    hidapi.write(handle, _ON if turn_on else _OFF)



if __name__ == '__main__':
    parser = ArgumentParser(description='Simple CLI app that turns off special options for F-keys on Logitech K400 Plus Wireless Touch keyboard')
    parser.add_argument('--on', help='Used to activate special functions for F-keys (media control, search etc.)\
        "By default it switches off this functionality', action="store_true")
    args = parser.parse_args()

    euid = os.geteuid()
    if euid != 0:
        print('Script not started as root.')
        exit(1)

    main(args.on)

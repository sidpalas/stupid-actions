from pyvesync import VeSync

import os
import time

VESYNC_PASS = os.environ.get('VESYNC_PASS')

manager = VeSync("sid.palas@gmail.com", VESYNC_PASS, time_zone='America/New_York')
manager.login()
manager.update()

my_switch = manager.outlets[0]
my_switch.turn_on()
time.sleep(5)
my_switch.turn_off()
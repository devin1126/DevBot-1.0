#!/usr/bin/env python3
import rospy
from devbot_teleop.msg import CMD
from pynput.keyboard import Listener, Key


def on_press(key):
    try:
        if key == Key.left:
            teleop_cmd.direction = 'left'
            print("Left!\n")
        elif key == Key.down:
            teleop_cmd.direction = 'backward'
            print("Backwards!\n")
        elif key == Key.up:
            teleop_cmd.direction = 'forward'
            print("Forward!\n")
        elif key == Key.right:
            teleop_cmd.direction = 'right'
            print("Right!\n")
    except AttributeError:
        teleop_cmd.direction = ''
        print("Invalid Key!\n")
    pub.publish(teleop_cmd)
    
def on_release(key):
    if key == Key.ctrl:
        print("Keyboard Reader Terminated!")
        return False
    teleop_cmd.direction = ''
    pub.publish(teleop_cmd)

if __name__ == '__main__':
    try:
        pub = rospy.Publisher('vel_cmd', CMD, queue_size=1)
        rospy.init_node('teleop_publisher', anonymous=False)
        teleop_cmd = CMD()

        with Listener (on_press=on_press, on_release=on_release) as listener:
            listener.join()
        


    except rospy.ROSInterruptException:
        print("node terminated cleanly!")
        pass

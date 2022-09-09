import i3ipc
import time
import os

i3 = i3ipc.Connection()

# Define a callback to be called when you switch workspaces.
def on_workspace_focus(self, e):
    # The first parameter is the connection to the ipc and the second is an object
    # with the data of the event sent from i3.
    if e.current:
        print('Windows on this workspace:')
        for w in e.current.leaves():
            print(w.name)

# Dynamically name your workspaces after the current window class
def run_once(f):
    def wrapper(*args, **kwargs):
        if not wrapper.has_run:
            wrapper.has_run = True
            return f(*args, **kwargs)
    wrapper.has_run = False
    return wrapper


@run_once
def my_function():
    os.system('i3-msg [title="youtube-list"] scratchpad show &&  i3-msg [title="ranger"] scratchpad show &&  i3-msg [title="fterm6"] scratchpad show && i3-msg [title="Htop"] scratchpad show ')

def on_window_focus(i3, e):
    focused = i3.get_tree().find_focused()
    ws_name = "%s:%s" % (focused.workspace().num, focused.window_class)
    ws = "%s" % (focused.workspace().num)
    action = run_once(my_function)
    reset = 0

    print(action.has_run)

    if int(ws) != 0:
        i3.command('rename workspace to "%s"' % ws_name)
        # print("ws", ws)
        action.has_run = False
        reset = 1


        if focused.window_class.lower() == "termite":
            ws_name = "%s:%s" % (focused.workspace().num, focused.window_title)
            i3.command('rename workspace to "%s"' % ws_name)

    if int(ws) == 0:
        if reset == 1:
             os.system('i3-msg [title="youtube-list"] scratchpad show &&  i3-msg [title="ranger"] scratchpad show &&  i3-msg [title="fterm6"] scratchpad show && i3-msg [title="Htop"] scratchpad show ')
             reset = 0
             action()
            # print(action.has_run )

# Subscribe to events
i3.on('workspace::focus', on_workspace_focus)
i3.on("window::focus", on_window_focus)


    #start = time.time()
    # end = time.time()
    # # run your code
    # elapsed_time = end - start
    # time.strftime("%H:%M:%S", time.gmtime(elapsed_time))
    # print(elapsed_time)

# Start the main loop and wait for events to come in.
i3.main()

######
# !/usr/bin/env python3

# import i3ipc
# # Create the Connection object that can be used to send commands and subscribe
# # to events.
# i3 = i3ipc.Connection()

# # Print the name of the focused window
# focused = i3.get_tree().find_focused()
# print('Focused window %s is on workspace %s' %
#       (focused.name, focused.workspace().name))

# # Query the ipc for outputs. The result is a list that represents the parsed
# # reply of a command like `i3-msg -t get_outputs`.
# outputs = i3.get_outputs()

# print('Active outputs:')

# for output in filter(lambda o: o.active, outputs):
#     print(output.name)

# # Send a command to be executed synchronously.
# i3.command('focus left')

# # Take all fullscreen windows out of fullscreen
# for container in i3.get_tree().find_fullscreen():


# # Print the names of all the containers in the tree
# root = i3.get_tree()
# print(root.name)
# for con in root:
#     print(con.name)

# # Define a callback to be called when you switch workspaces.
# def on_workspace_focus(self, e):
#     # The first parameter is the connection to the ipc and the second is an object
#     # with the data of the event sent from i3.
#     if e.current:
#         print('Windows on this workspace:')
#         for w in e.current.leaves():
#             print(w.name)

# # Dynamically name your workspaces after the current window class
# def on_window_focus(i3, e):
#     focused = i3.get_tree().find_focused()
#     ws_name = "%s:%s" % (focused.workspace().num, focused.window_class)
#     i3.command('rename workspace to "%s"' % ws_name)

# # Subscribe to events
# i3.on('workspace::focus', on_workspace_focus)
# i3.on("window::focus", on_window_focus)

# # Start the main loop and wait for events to come in.
# i3.main()

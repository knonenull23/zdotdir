#! /usr/bin/osascript -l JavaScript
ObjC.import("stdlib")
const { processes: { Terminal }} = Application("System Events")
const tabs = Terminal.windows[0].tabGroups.description()
$.exit(tabs.length)

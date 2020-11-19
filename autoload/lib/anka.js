#! /usr/bin/osascript -l JavaScript
anka = Application('System Events').applicationProcesses.Anka
anka.windows[0].attributes.AXFullScreen.value = true
console.clear

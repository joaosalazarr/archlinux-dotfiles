pragma Singleton
import QtQuick
import Quickshell

Singleton
{
  id: root

  signal tick()

  Timer
  {
    interval: 1000
    running: true
    repeat: true
    onTriggered: root.tick()
  }
}

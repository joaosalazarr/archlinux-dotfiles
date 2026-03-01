pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton
{
  id: root
  readonly property string time:
  {
    Qt.formatDateTime(clock.date, "HH:mm • dddd, dd/MM")
  }
  
  SystemClock
  {
    id: clock
    precision: SystemClock.seconds
  }
}

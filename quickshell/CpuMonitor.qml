pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton
{
  id: root

  property int cpuUsage: 0
  property int lastCpuTotal: 0
  property int lastCpuIdle: 0

  Process 
  {
    id: cpuProc

    command: ["head", "-1", "/proc/stat"]

    stdout: SplitParser {
      onRead: data => {
        var p = data.trim().split(/\s+/)
        var idle = parseInt(p[4]) + parseInt(p[5])
        var total = p.slice(1, 8).reduce((a, b) => a + parseInt(b), 0)
        if (lastCpuTotal > 0)
        {
          cpuUsage = Math.round(100 * (1 - (idle - lastCpuIdle) / (total - lastCpuTotal)))
        }

        lastCpuTotal = total
        lastCpuIdle = idle
      }
    }
  }
  Connections
  {
    target: GlobalClock
    function onTick()
    {
      cpuProc.running = true
    }
  }
}

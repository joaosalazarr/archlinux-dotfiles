import Quickshell
import QtQuick

Scope
{
  Variants
  {
    model: Quickshell.screens

    PanelWindow
    {
      required property var modelData
      screen: modelData
      property color bgColor: "#1a1b26"
      property color fgColor: "#a9b1d6"
      property string fontFamily: "JetBrainsMono Nerd Font"

      anchors
      {
        top: true
        left: true
        right: true
      }
      
      implicitHeight: 30
      color: bgColor

      ClockWidget
      {
        anchors.centerIn: parent
        color: fgColor
        font: fontFamily
      }

      CpuUsageWidget
      {
        anchors.right: parent.right
        color: fgColor
        font: fontFamily
      }
    }
  }
}

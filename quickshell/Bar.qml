import Quickshell
import QtQuick
import QtQuick.Layouts

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

      RowLayout 
      {
        anchors.fill: parent
        anchors.margins: 8

        // Left Section
        RowLayout
        {
          id: leftSection
          spacing: 8
          Layout.alignment: Qt.AlignVCenter

        }
        
        Item { Layout.fillWidth: true }

        // Center Section
        RowLayout
        {
          id: centerSection
          spacing: 8
          anchors.centerIn: parent

          ClockWidget
          {
            color: fgColor
            font: fontFamily
          }
        }

        Item { Layout.fillWidth: true }

        // Right Section
        RowLayout
        {
          id: rightSection
          spacing: 8
          Layout.alignment: Qt.AlignVCenter

          CpuUsageWidget
          {
            color: fgColor
            font: fontFamily
          }
        }
      }
    }
  }
}

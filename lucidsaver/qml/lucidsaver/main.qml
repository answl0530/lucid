import QtQuick 1.0

Rectangle {
    id:screen
    width: 360
    height: 640
    color: "#000000"

    MouseArea {
        x: 0
        y: 0
        visible: true
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.fill: parent
        onClicked: {
            Qt.quit();
        }
    }

    Image {
        id: bg
        x: 0
        y: 0
        source: "qrc:/images/bituhnu.png"
        width: 2048
        height: 1366
        smooth: false
    }

    Image {
        id: mask
        x: 0
        y: 0
        fillMode: Image.Tile
        width: 360
        height: 640
        source: "qrc:/images/raster4.png"
    }

    Rectangle {
        id: clockfaceborder
        x: 95
        y: 95
        width: 170
        height: 170;
        color: "#ffffff"
    }

    Rectangle {
        id: clockface
        x: 96
        y: 96
        width: 168
        height: 168;
        color: "#000000"
    }
    Rectangle {
        id: clock
        x: 100
        y: 100
        width: 160
        height: 160;
        color: "#000000"

         Timer {
             id:clocktimer
             triggeredOnStart: true
             running: true
             repeat: true
             onTriggered: {

                 var date = new Date();
                 //console.log("tick "+date);

                 var th = date.getHours() % 12;
                 var tm = date.getMinutes();

                 // set clock hands rotation angles
                 h.angle = ((th+tm/60.0)/12.0)*360.0;
                 m.angle = (tm/60.0)*360.0;

                 // randomly offset background
                 bg.x = -Math.random()*(bg.width-screen.width);
                 bg.y = -Math.random()*(bg.height-screen.height);

                 // schedule timer to fire when minute hand should be moved
                 clocktimer.interval = 1000*(61-date.getSeconds());
             }
         }


         Rectangle {
             x: 76
             y: 32
             width: 8
             height: 52;
             color: "#ffff00"
             transform: Rotation {
                 id:h
                 origin.x: 4; origin.y: 48;
             }
         }

         Rectangle {
             x: 78
             y: 12
             width: 4
             height: 70;
             color: "#ffff00"
             transform: Rotation {
                 id:m
                 origin.x: 2; origin.y: 68;
             }
         }

         Text {
             x: 152
             y: 73
             color: "#ff0000"
             text: "3"
             font.bold: true
             font.pixelSize: 12
         }

         Text {
             x: 0
             y: 73
             color: "#ff0000"
             text: "9"
             font.bold: true
             font.pixelSize: 12
         }

         Text {
             x: 72
             y: 0
             color: "#ff0000"
             text: "12"
             font.bold: true
             font.pixelSize: 12
         }

         Text {
             x: 76
             y: 146
             color: "#ff0000"
             text: "6"
             font.bold: true
             font.pixelSize: 12
         }

    }




}

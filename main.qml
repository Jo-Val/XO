import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3


Window {
    id: win
    minimumWidth: 610
    maximumWidth: 610
    minimumHeight:  cl.height+20
    maximumHeight:  cl.height+20
    color:  Qt.rgba(Math.random(),Math.random(),Math.random(),1);
    visible: true
    title: qsTr("XO") // название
    ColumnLayout{
        id:cl
        anchors.centerIn: parent
        spacing: 2
        Gameplay{
            id:cl_game
        }
        Toolbar{
            height: 100
            id:cl_tool
            onQuitApp:{
                Qt.quit()
            }
            onClearGame: {

                cl_game.cleanGame()
            }
        }
    }
}

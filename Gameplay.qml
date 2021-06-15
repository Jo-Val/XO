import QtQuick 2.9
import QtQuick.Window 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
GridLayout{
    id: game
    width: 800
    height: 800
    property int config: 0
    property int size: 50
    property int p1: 2
    property int p2: 1
    columns:3
    rows: 3
    columnSpacing: 0
    rowSpacing: 0



    function cleanGame(){
    dialogs.win = true


        for (var i = 0; i<9; i++){
            bricks.itemAt(i).color_= 0;
                bricks.itemAt(i).use= false;
                bricks.itemAt(i).zevardo= 0;
        }
    }
    function down() {
        dialog.win = false;
        dialogs.win = false;
        var list = []
        //сбор информации
        for (var j = 0; j<9; j++)
           list.push( bricks.itemAt(j).color_)

        var winchek = helper.winer(list)


        if (winchek){

            var G = helper.light(list)
            for (var f = 0; f<9; f++){
                if(G[f] === 5){
                    bricks.itemAt(f).zevardo=1;
                }
            }

            dialog.texts=winchek
            game.config=0
            dialog.win = true


        }

}

    Repeater{
        id:bricks
        model:9
        Brick {
                onUpdated: cl_game.down()
        }
    }
    Dialog {
        property bool win: false
        property string texts: "-1"
        height: 300
        width:500
        id: dialog
        Label {
                text:dialog.texts
            }
        title:"Игра оконченна"
        modal: true
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
        visible: false
    }
    Dialog {
        property bool win: true
        property string texts: "change"
        height: 300
        width:500
        id: dialogs
        Label {
                text:"Первый игрок       Второй игрок"
            }
        title:"Выбор фишек"
        modal: true
        standardButtons: Dialog.Ok
        anchors.centerIn: parent
        visible: win
        MouseArea{
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p1==1
            }
            visible: !(game.p2==1)
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/1.png"
            }
           // text:"1"
            x:0
            y:0+20
            width: game.size
            height: game.size
            onClicked: {
                game.p1 = 1
            }
        }MouseArea{
            //text:"2"
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p1==2
            }
            visible: !(game.p2==2)
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/2.png"
            }
            x:0
            y:game.size+20
            width: game.size
            height: game.size
            onClicked: {
                game.p1 = 2
            }
        }MouseArea{
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p1==3
            }
            visible: !(game.p2==3)
            //text:"3"
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/3.png"
            }
            x:game.size
            y:0+20
            width: game.size
            height: game.size
            onClicked: {
                game.p1 = 3
            }
        }MouseArea{
            visible: !(game.p2==4)
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p1==4
            }
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/4.png"
            }
            x:game.size
            y:game.size+20
            width: game.size
            height: game.size
            onClicked: {
                game.p1 = 4
            }
        }MouseArea{
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p2==1
            }
            visible: !(game.p1==1)
            //text:"1"
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/1.png"
            }
            x:100
            y:0+20
            width: game.size
            height: game.size
            onClicked: {
                game.p2 = 1
            }
        }MouseArea{
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p2==2
            }
            visible: !(game.p1==2)
            //text:"2"
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/2.png"
            }
            x:100
            y:game.size+20
            width: game.size
            height: game.size
            onClicked: {
                game.p2 = 2
            }
        }MouseArea{
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p2==3
            }
            visible: !(game.p1==3)
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/3.png"
            }
           // text:"3"
            x:game.size+100
            y:20
            width: game.size
            height: game.size
            onClicked: {
                game.p2 = 3
            }
        }MouseArea{
            Rectangle{
                color:"green"
                width: game.size
                height: game.size
                visible: game.p2==4
            }
            visible: !(game.p1==4)
            //text:"4"
            Image {
                width: game.size
                height: game.size
                source: "qrc:/pics/4.png"
            }
            x:100+game.size
            y:game.size+20
            width: game.size
            height: game.size
            onClicked: {
                game.p2 = 4
            }
        }

    }


}

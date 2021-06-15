import QtQuick 2.0

Rectangle{

    signal updated(int color_)
    border.width: 2
    width: 200
    height: 200
    color : Qt.rgba(1,1,1,1);

    property int zevardo: 0
    property int color_: 0



    property bool use: false

    Image {
        width: 200;
        height: 200;
        source: "qrc:/pics/1.png"
        visible: use*(color_===1)
    }
    Image {
        width: 200;
        height: 200;
        visible: use*(color_===2)
        source: "qrc:/pics/2.png"
    }
    Image {
        width: 200;
        height: 200;
        visible: use*(color_===3)
        source: "qrc:/pics/3.png"
    }
    Image {
        width: 200;
        height: 200;
        visible: use*(color_===4)
        source: "qrc:/pics/4.png"
    }

    Image {
        width: 200;
        height: 200;
        visible: zevardo
        source: "qrc:/pics/win.png"
    }

    function up(){
        /*Проверяем можно ли нажать*/
        if(!use){
            /* Запрещаем нажимать повторно и увеличиваем счетчик ходов */
            use = true ;
            game.config+=1;

            /*Присвоение цвета*/
            if(config%2==0){
                color_ = game.p2;
            }
            else{
                color_ = game.p1;
            }
        }
    }

        MouseArea{
            width: 200;
            height: 200;

            onClicked: {
                up()
                updated(parent.color_);

        }
    }
}

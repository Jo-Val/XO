#include "helper.h"
#include <QDebug>
#include<QSet>
#include<QMap>
#include<QVector>
#include <QList>
#include <QRandomGenerator>
#include <QDialog>
#include <QMessageBox>
#include<QApplication>

helper::helper(QObject *parent) : QObject(parent)
{

}

QString helper::winer(QVector<int> G)
{
    if(G[0]==G[4] && G[0]==G[8] && G[0]){

        return G[0]==1 ? "1" :"2";
    }
    if(G[2]==G[4] && G[2]==G[6] && G[2]){

        return G[2]==1 ? "1" :"2";
    }

    if (1){
        for(int i = 0;i<3;i++){
            if(G[i] && G[i]==G[i+3] &&G[i+6]==G[i+3]){
                return G[i]==1 ? "1" :"2";
            }
            if(G[i*3] && G[i*3]==G[i*3+1] && G[i*3+1]==G[i*3+2]){
                return G[i*3+2]==1 ? "1" :"2";
            }

        }
    }

        return 0;

};


QVector<int>helper::light(QVector<int> G)
{
    if(G[0]==G[4] && G[0]==G[8]){
        G[0]=G[4]=G[8]=5;
        return G;
    }
    if(G[2]==G[4] && G[2]==G[6]){
        G[2]=G[4]=G[6]=5;
        return G;
    }
    for(int i = 0;i<3;i++){

        if(G[i] && G[i]==G[i+3] &&G[i+6]==G[i+3]){
            G[i]=G[i+3]=G[i+6]=5;
            return G;
        }

        if(G[i*3] && G[i*3]==G[i*3+1] && G[i*3+1]==G[i*3+2]){
            G[i*3]=G[i*3+1]=G[i*3+2]=5;
            return G;

    }

    }
    return G;
};



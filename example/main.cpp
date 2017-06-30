/*******************************************************************************
  Copyright (C) 2016 Milo Solutions
  Contact: https://www.milosolutions.com

  This file is part of Milo Code Database, which is a collection of useful code
  snippets often reused within Milo Solutions. As such, this code is present in
  many projects done by Milo Solutions and does not constitute a copyright
  infridgement.

  You are entitled to do anything you please with this code, just as with the
  rest of code you bought. Files not containing this notice were written
  specifically for this project and have not been shared with any other party
  within or without Milo.
*******************************************************************************/

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "../MBarcodeCaptureFilter.h"

//! Example BarcodeScanner usage
int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);
    a.setApplicationName("Example Barcode app");
#ifdef DRAW_REGION
    qRegisterMetaType<QVector<QPointF> >("QVector<QPointF>");
#endif
    qmlRegisterType<BarcodeCaptureFilter>("BarcodeCaptureFilter", 1, 0, "BarcodeCaptureFilter");
    QQmlApplicationEngine engine;
    engine.load(QUrl("qrc:/qml/main.qml"));

    if (engine.rootObjects().isEmpty())
        return -1;

    return a.exec();
}

/*
 * Copyright 2018 Rodney Dawes
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.1
import QtQuick.Window 2.1
import QtWebEngine 1.3

Window {
    id: mainWindow

    width: 800
    height: 600

    title: "Diogenes NG"

    Page {
        id: mainPage
        anchors.fill: parent

        header: ToolBar {
            id: mainToolbar
            width: parent.width
            height: 48

            Rectangle {
                anchors.fill: parent
                color: "#eeeeec"
            }

            RowLayout {
                anchors.fill: parent
                anchors.margins: 4

                RowLayout {
                    anchors.left: parent.left
                    Layout.alignment: Qt.AlignLeft

                    ToolButton {
                        id: backButton
                        focus: false
                        enabled: webView.canGoBack
                        Image {
                            anchors.margins: 8
                            anchors.fill: parent
                            fillMode: Image.PreserveAspectFit
                            source: "icons/go-previous.svg"
                        }
                        onClicked: {
                            webView.goBack();
                        }
                    }
                    ToolButton {
                        id: forwardButton
                        focus: false
                        enabled: webView.canGoForward
                        Image {
                            anchors.margins: 8
                            anchors.fill: parent
                            fillMode: Image.PreserveAspectFit
                            source: "icons/go-next.svg"
                        }
                        onClicked: {
                            webView.goForward();
                        }
                    }
                    ToolButton {
                        id: reloadButton
                        Image {
                            anchors.margins: 8
                            anchors.fill: parent
                            fillMode: Image.PreserveAspectFit
                            source: webView.loading ? "icons/cancel.svg" : "icons/reload.svg"
                        }
                        onClicked: {
                            webView.loading ? webView.stop() : webView.reload();
                        }
                    }
                }
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "#eeeeec"
        }

        Rectangle {
            color: "#343434"
            width: parent.width
            height: 2
            x: 48
        }

        WebEngineView {
            id: webView
            anchors.fill: parent

            visible: true
            profile: WebEngineProfile {
                offTheRecord: true
            }
            settings {
                javascriptEnabled: true
                pluginsEnabled: false
                fullScreenSupportEnabled: false
                autoLoadImages: true
            }

            onCertificateError: {
                error.defer();
            }

            onNavigationRequested: {
                var newurl = new String(request.url);
                if (newurl.startsWith(Qt.application.arguments[1])) {
                    return;
                }
                request.action = WebEngineNavigationRequest.IgnoreRequest;
                Qt.openUrlExternally(request.url);
            }

            Component.onCompleted: {
                webView.url = Qt.application.arguments[1];
            }
        }
    }
}

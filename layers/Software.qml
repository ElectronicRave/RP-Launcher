import QtQuick 2.12


  Item {
    id: software
    property var itemWidth : 380
    property var itemHeight : itemWidth

   Keys.onPressed: {

      //Back to Home. It's up here so when a list has no games you can still go back to the home
      if (api.keys.isCancel(event)) {
          event.accepted = true;
	  api.memory.unset('currentCollectionIndex', currentCollectionIndex);
          searchValue='';
          header__search_input.text='Search...';
          navigate('Home');
          return;
      }

    }

   Rectangle {
        id: header
        color: "transparent"
        width: headerCSS.width
        height: header_inner.height+header__border.height+aspectRatio === 43 ? 40 : 120
	clip:true

        anchors {
	    top: parent.top; topMargin: 15
        }

        Rectangle {
          id: header_inner
          color:"transparent"
          width:parent.width-60
          height: aspectRatio === 43 ? 40 : 110

          anchors {
		top: parent.top; topMargin: 5;
                left: parent.left; leftMargin: 30;
	  }         

            Rectangle {
              id: header__search
              color: theme.background
              width: aspectRatio === 43 ? 200 : 400
              height: aspectRatio === 43 ? 30 : 60
              border.color: theme.text
              border.width: 1
              visible: false

              anchors {
		  top: parent.top; topMargin: 25;
                  right: parent.right
	      }

                  TextInput {
                      property var marginRight: aspectRatio === 43 ? 40 : 100
                      id: header__search_input
                      clip: true
                      width: parent.width-marginRight
                      height: parent.height
		      color: theme.text
                      font.pixelSize: aspectRatio === 43 ? 14 : 28

                      anchors {
			   top: parent.top
                           left: parent.left
                           leftMargin: aspectRatio === 43 ? 6  : 24
                           topMargin:  aspectRatio === 43 ? 8 : 44
			   verticalCenter: parent.verticalCenter
		      }

                     onTextEdited: {
                          gameView.currentIndex = 0; //We move the highlight to the first item
                          searchValue = header__search_input.text;
                          gameView.model = searchGames;
                      }

                 }

            }
 
      }

          Rectangle {
            id: header__border
	    width: parent.width-40;
            height: 0
            color: "transparent"

            anchors {
		top: header_inner.bottom; topMargin: 8
                left: parent.left; leftMargin: 20
	    }

        }

    }

    Rectangle {
        id: main
        color: "transparent"
        width: wrapperCSS.width
        height: mainCSS.height-20
        anchors.top: header.bottom

        Rectangle {
            id: games
            visible: true
	    clip: true
            color: "transparent"
            width: parent.width
            height: parent.height

            anchors {
		left: parent.left
                top: parent.top
                bottom: parent.bottom
	    }

            GridView {
                id: gameView
                width: parent.width
                height: parent.height
		cellWidth: itemWidth
                cellHeight: itemHeight

            anchors {
                left: parent.left; leftMargin: 200
                top: parent.top; topMargin: 72
                right: parent.right;
                bottom: parent.bottom;
            }

                model: currentCollection.games
                delegate: gameViewDelegate
                focus: currentPage === 'Software' ? true : false ;
                snapMode: ListView.SnapOneItem

                highlightRangeMode: ListView.StrictlyEnforceRange
                preferredHighlightBegin: 1
                preferredHighlightEnd: 0

                Keys.onUpPressed:       { moveCurrentIndexUp(); }
                Keys.onDownPressed:     { moveCurrentIndexDown(); }
                Keys.onLeftPressed:     { moveCurrentIndexLeft(); }
                Keys.onRightPressed:    { moveCurrentIndexRight(); }

                Component {
                    id: gameViewDelegate

                    Item {
                      id: delegateContainer
                      property bool selected: GridView.isCurrentItem
                      width: itemWidth
                      height: itemHeight

                      Keys.onPressed: {
                        //Launch game
                      if (api.keys.isAccept(event)) {
                          event.accepted = true;
                          currentGameIndex = index;
                          currentGame.launch();
                          return;
                      }
                      //We reset collection when going home
                      if (api.keys.isCancel(event)) {
                          api.memory.unset('currentCollectionIndex', currentCollectionIndex);
                          return;
                      }

                        //Next collection
                        if (api.keys.isNextPage(event)) {
                            event.accepted = true;
                            currentCollectionIndex = currentCollectionIndex+1;
                            return;
                        }

                        //Prev collection
                        if (api.keys.isPrevPage(event)) {
                            event.accepted = true;
                            currentCollectionIndex = currentCollectionIndex-1;
                            return;
                        }

                      }

                      Rectangle {
                        color: "transparent"
                        width: parent.width-8
                        height: parent.height-8
                        clip: true

                        Rectangle {
                          id:game__inner_border
                          width: parent.width
                          height: parent.height
			  color: theme.buttons

                          anchors {
				horizontalCenter: parent.horizontalCenter
                                verticalCenter: parent.verticalCenter
			  }

                        }

                        Image {
                            id: game_screenshot
                            width: parent.width
                            height: parent.height
                            fillMode: Image.PreserveAspect
                            asynchronous: true

                            source: {
                                if (currentCollection.shortName !== "android") {
                                    if (modelData.assets.screenshots[0]) {
                                        return modelData.assets.screenshots[0]
                                    }
                                    return ""
                                }
                                return ""
                            }

                        }

                        Image {
                            id: gamelogo
                            width: parent.width
                            height: parent.height
			    asynchronous: true

                            anchors {
                                fill: parent
                                margins: 72
                            }

                           source: {
                                if (currentCollection.shortName == "android") {
                                    if (modelData.assets.boxFront) {
                                        return modelData.assets.boxFront
                                    }
                                    return ""
                                }
                                if (modelData.assets.logo) {
                                    return modelData.assets.logo
                                }
                                return ""
                            }
                            sourceSize { width: 256; height: 256 }
                            fillMode: Image.PreserveAspect
                        }
 
		           MouseArea {
		                anchors.fill: game_screenshot
				hoverEnabled: true
		                onEntered: {}
		                onExited: {}
				onClicked: {
				    if (selected)
				{
				  currentGameIndex = index;
		                  currentGame.launch();
				}
				else
				   gameView.currentIndex = index;
				}
				onPressAndHold: {
				  currentGameIndex = index;
		                  currentGame.favorite = !currentGame.favorite;
				}

			     }

                        Rectangle{
                          id: game__is_selected
                          width: parent.width
                          height: parent.height
                          color: "transparent"
                          border.color: selected ? theme.accent : wrapperCSS.background
                          border.width: 8
			  anchors.centerIn: screenshot
			  z: 7
                        }

                        Canvas {
                            id: game__is_fav

                            anchors {
                                right: parent.right; rightMargin: 8;
                                top: parent.top; topMargin: 8;
                            }

                            visible: modelData.favorite && currentCollection.shortName !== "all-favorites"

                            // handler to override for drawing

                            Image {
                                width: 56
                                fillMode: Image.PreserveAspectFit
                                source: focus ? "../assets/icons/favorite.png" : "../assets/icons/favorite.png"
                                asynchronous: true

                                anchors {
                                    right: parent.right; rightMargin: 8;
                                    top: parent.top; topMargin: 8;
                                }

                            }

                         }

                      }

                      Rectangle{
                        id: game__title
                        color: "#2C2C2C"
                        width: gameTitle.contentWidth
                        height: 60
                        //visible: selected ? 1 : 0

                        anchors {
                            bottom: parent.bottom; bottomMargin: 15
                            left: parent.left; leftMargin: 8
			    right: parent.right; rightMargin: 16
			    horizontalCenter: parent.horizontalCenter
                        }

                        y: xpos
                        z: 10 * index
                        opacity: 0.8

                        Text{
                          id: game__title_name
                          text: modelData.title
                          color: "#FFFFFF"
			  font.family: titleFont.name
			  font.bold: true
                          font.pixelSize: vpx(12*screenRatio)
			  elide: Text.ElideRight
                          horizontalAlignment: Text.AlignHCenter

			  anchors { 
                                bottom: parent.bottom; bottomMargin: 12;
                                left: parent.left; leftMargin: 0;
				right: parent.right; rightMargin: 0;
                            }

                         }

                     }

                  }

              }

          }

      }

        
    }

    Header{}

    Footer{}

}
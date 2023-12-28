import QtQuick 2.12


  Item {
    
    id: home  
  
    Rectangle {
        id: main
        color: "transparent"
        width: wrapperCSS.width
        height: mainCSS.height+115
        anchors.top: header.bottom
	        
        Rectangle {
          id: systems
          color: "transparent"
	  height: main.height-options.height-anchors.topMargin

          anchors {
		left: parent.left; leftMargin: 64;
                right: parent.right
                top: parent.top; topMargin: headerHeightCorrection === 0 ? 0 : 24 ;
	  }
          
              ListView {
                id: systemsListView
                model: api.collections
		snapMode: ListView.SnapOneItem
                delegate: systemsDelegate  
                orientation: ListView.Horizontal
                focus: currentPage === 'Home' ? true : false ;
		spacing: 8

                highlightRangeMode: ListView.StrictlyEnforceRange
                preferredHighlightBegin: 230
                preferredHighlightEnd: 1560
                highlightMoveDuration: 200
                highlightMoveVelocity: -1
		
		anchors {
	            left: parent.left;
                    right: parent.right;
                    top: parent.top; topMargin: 270
		}

               Keys.onLeftPressed: {  decrementCurrentIndex(); } 
                Keys.onRightPressed: {  incrementCurrentIndex(); }

                  Component {
                      id: systemsDelegate
                   
                   
                      Item {
                          id: systems__item_container
			  property bool selected: ListView.isCurrentItem
                          width: 380
                          height: width
                            
                          Keys.onPressed: {
                            if (api.keys.isAccept(event)) {
                                event.accepted = true;
                                
                                //We update the collection we want to browse
                                currentCollectionIndex = systems__item_container.ListView.view.currentIndex+3;
                                //We store the current collection so we go back there after playing
                                api.memory.set('currentCollectionIndex', currentCollectionIndex);
                                //We change Pages
                                navigate('Software');
                                return;
                            }      
                                                                
                          }                          
                          
                          Text {
                              id: systems__item_title
                              text: modelData.name
                              anchors.horizontalCenter: systems__item_container.horizontalCenter
                              color: theme.accent
                              font.pixelSize: vpx(15*screenRatio)
                              font.bold: true
                              font.family: titleFont.name
                              height: vpx(30*screenRatio)
                              verticalAlignment: Text.AlignVCenter
                              elide: Text.ElideRight
                              opacity: systems__item_container.ListView.isCurrentItem ? 1 : 0
                          }
                        
                          Rectangle {
                              id: systems__item
                              width: parent.width
                              height: parent.height
                              anchors.top : systems__item_title.bottom
  
                              Rectangle{
                                id: systems__item_inner
                                width: parent.width-8
                                height: parent.width-8
                                border.color: "transparent"
                                border.width: 8
                                color: theme.buttons

                                anchors {
				    top: systems__item.top; topMargin: 4;
                                    left: systems__item.left; leftMargin: 4;
				}
                                
                                Image {
                                    id: systems__img_bg
                                    height: parent.height      
                                    width: parent.width      
                                    fillMode: Image.PreserveAspect
                                    source: "../assets/images/logos/"+modelData.shortName+".jpg"
                                    asynchronous: true                                       
                                }                                                     

			        MouseArea {
			             anchors.fill: systems__img_bg
		 	   	     hoverEnabled: true
 		 	             onEntered: {}
 			             onExited: {}
				     onClicked: {
					  if (selected)
				    {
				     //We update the collection we want to browse
				     currentCollectionIndex = systems__item_container.ListView.view.currentIndex+3;
				     //We store the current collection so we go back there after playing
   				     api.memory.set('currentCollectionIndex', currentCollectionIndex);
				     //We change Pages
  				     navigate('Software');
 				     return;
				    }
				    else
		 		       systemsListView.currentIndex = index
				    }
	   		         }
                                                                              
                              }

                              Rectangle {
                                id: systems__item_border
                                width: parent.width
                                height: parent.height
                                border.color: systems__item_container.ListView.isCurrentItem ? theme.accent : wrapperCSS.background
                                border.width: 8     
                                color:"transparent"
				anchors.centerIn: systems__img_bg                                                   
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
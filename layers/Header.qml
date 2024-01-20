import QtQuick 2.12
import QtGraphicalEffects 1.12


  Rectangle {
      id: header
      color: headerCSS.background
      width: headerCSS.width
      height: headerCSS.height
      property var chargingPercent: api.device.batteryPercent*100
      property bool chargingStatus: api.device.batteryCharging

      anchors {
	  top: parent.top
      }

      //Battery status

      Rectangle {
        id: header__battery
        width: 130
        color: "transparent"
	visible: headerHeightCorrection === 0 ? 1 : 0

        anchors {
	    right: parent.right; rightMargin: aspectRatio === 43 ? 16 : 24
            top: parent.top; topMargin: 46
        }

        Image {
              id: header__battery_icon
              height: aspectRatio === 43 ? 16 : 36
              fillMode: Image.PreserveAspectFit
              source: api.memory.get('theme')  == "themeDark" ? "../assets/icons/battery_light.png" : "../assets/icons/battery_dark.png"
	      visible: chargingPercent

              anchors {
		  top: parent.top; topMargin: aspectRatio === 43 ? 3 : 4
                  right: header__battery_number.left; rightMargin: 6
              }

         }

        Text {
            id: header__battery_number
            text: Math.floor(api.device.batteryPercent*100)+"%"
            color: theme.text
            font.pixelSize: aspectRatio === 43 ? 18 : 36

	    anchors {
		top: parent.top
	    }

        }

         Rectangle {
              id: header__battery_icon_fill
              color: theme.title
              width: aspectRatio === 169 ? Math.floor(chargingPercent*0.49) : Math.floor(chargingPercent*0.22)
              height: aspectRatio === 169 ? 18 : 10

              anchors {
                  top: header__battery_icon.top; topMargin: aspectRatio === 169 ? 9 : 2
                  left: header__battery_icon.left; leftMargin: aspectRatio === 169 ? 10 : 2
	      }

           }

                Image {
                    id: header__battery_icon_charging
                    width: aspectRatio === 43 ? 16 : 34
                    height: width
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/icons/charging.png"
                    sourceSize.width: vpx(10)
                    sourceSize.height: vpx(15)
		    visible: chargingStatus && chargingPercent < 100
                   
                anchors {
		    top: parent.top; topMargin: aspectRatio === 43 ? 3 : 5
                    right: header__battery_icon.right; rightMargin: 26
                }

	     }

	  }

	  //Profile icon

	  Image {
                id: profileIcon
                width: vpx(36*screenRatio)
                height: width
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.png"
		smooth: true

                anchors {
		    top: parent.top; topMargin: 32
		    left: parent.left; leftMargin: 48
		}

            }

	    MouseArea {
	         anchors.fill: profileIcon
	         onPressAndHold:{
	           swapTheme();
 	         }

 	    }

	      //All games

	      Text {
		  id: all
                  text: "All"
                  color: theme.accent
		  font.bold: true
                  font.pixelSize: vpx(16*screenRatio)

                  anchors {
		      top: parent.top; topMargin: 65
		      left: parent.left; leftMargin: 220
		  }

             }

	    MouseArea {
	         anchors.fill: all
	         onClicked: {
	           currentCollectionIndex = 2;
 	           navigate('Software');
	         }

	    }

	      //Favorite games

              Text {
		  id: favorite
                  text: "Favorite"
                  color: theme.text
                  font.pixelSize: vpx(16*screenRatio)

                  anchors {
		      top: parent.top; topMargin: 65
		      left: parent.left; leftMargin: 300
		  }   

             }

	    MouseArea {
	         anchors.fill: favorite
	         onClicked: {
	           currentCollectionIndex = 0;
	           navigate('Software');
 	        }

 	   }

	      //Played games

              Text {
		  id: played
                  text: "Played"
                  color: theme.text
                  font.pixelSize: vpx(16*screenRatio)

                  anchors {
		      top: parent.top; topMargin: 65
		      left: parent.left; leftMargin: 490
		  }    

             }

	    MouseArea {
	         anchors.fill: played
	         onClicked: {
	           currentCollectionIndex = 1;
	           navigate('Software');
	         }

	    }

	     //Search games

              Text {
		  id: search
		  text: "Search"
		  color: theme.text
                  font.pixelSize: vpx(16*screenRatio)
		  visible: currentPage === 'Software' ? 1 : 0

                  anchors {
		      top: parent.top; topMargin: 65
		      left: parent.left; leftMargin: 650
		  }    

	     }

	    MouseArea {
	         anchors.fill: search
	         onClicked: {
		     searchValue = ''
	             header__search_input.clear();           
	             header__search_input.focus = true;
	             return;
	         }

 	   } 

     }
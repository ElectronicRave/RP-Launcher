import QtQuick 2.12
import QtGraphicalEffects 1.12


  Rectangle {
      id: header
      color: headerCSS.background
      width: headerCSS.width
      height: headerCSS.height
      anchors.top: parent.top
      property var chargingPercent: api.device.batteryPercent*100
      property bool chargingStatus: api.device.batteryCharging

      //Battery status

      Rectangle {
        id: header__battery
        width: 130
        color: theme.background
	visible: headerHeightCorrection === 0 ? 1 : 0;

        anchors {
	    right: parent.right; rightMargin: aspectRatio === 43 ? 16 : 24;
            top: parent.top; topMargin: 46;
        }

        Text {
            id: header__battery_number
            text: Math.floor(api.device.batteryPercent*100)+"%"
            anchors.top: parent.top
            color: theme.text
            font.pixelSize: aspectRatio === 43 ? 18 : 36
        }

        Image {
              id: header__battery_icon
              height: aspectRatio === 43 ? 16 : 36
              fillMode: Image.PreserveAspectFit
              source: api.memory.get('theme')  == "themeDark" ? "../assets/icons/battery_light.png" :  "../assets/icons/battery_dark.png"
              asynchronous: true
	      smooth: true
	      antialiasing: true
	      visible: chargingPercent

              anchors {
		  top: parent.top; topMargin: aspectRatio === 43 ? 3 : 4;
                  right: header__battery_number.left; rightMargin: 6
              }

         }

          Rectangle {
              id: header__battery_icon_fill
              color: theme.title
              radius: 2
              width: aspectRatio === 169 ? Math.floor(chargingPercent*0.56) : Math.floor(chargingPercent*0.22)
              height: aspectRatio === 169 ? 30 : 10

              anchors {
                  top: header__battery_icon.top; topMargin: aspectRatio === 169 ? 3: 2;
                  left: header__battery_icon.left; leftMargin: aspectRatio === 169 ? 3: 2;
	      }

           }

                Image {
                    id: header__battery_charging_icon
                    width: aspectRatio === 43 ? 16 : 36
                    height: width
                    fillMode: Image.PreserveAspectFit
                    source: "../assets/icons/charging.png"
                    sourceSize.width: vpx(10)
                    sourceSize.height: vpx(15)
              	    asynchronous: true
	     	    smooth: true
	     	    antialiasing: true
		    visible: chargingStatus && chargingPercent < 100
                    
              anchors {
		  top: parent.top; topMargin: aspectRatio === 43 ? 3 : 4;
                  right: header__battery_icon.right; rightMargin: 22
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
		asynchronous: true
		smooth: true
	     	antialiasing: true

                anchors {
		    top: parent.top; topMargin: 32;
		    left: parent.left; leftMargin: 48;
		}

            }

	    MouseArea {
	         anchors.fill: profileIcon
		 onClicked:{}
	         onPressAndHold:{
	           swapTheme();
 	        }

 	   }

	      //All games

	      Text {
		  id: all
                  text: "All"
                  color: theme.text
                  font.pixelSize: vpx(16*screenRatio)

                  anchors {
		      top: parent.top; topMargin: 65;
		      left: parent.left; leftMargin: 220;
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
		      top: parent.top; topMargin: 65;
		      left: parent.left; leftMargin: 300;
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
		      top: parent.top; topMargin: 65;
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
		      top: parent.top; topMargin: 65;
		      left: parent.left; leftMargin: 650;
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
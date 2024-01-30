import QtQuick 2.12


	Rectangle {
		id: footer
		property var buttonSize: aspectRatio === 43 ? 85 : vpx(65*screenRatio)
		property var buttonTextSize: aspectRatio === 43 ? 14 : vpx(14*screenRatio)
		property var buttonRoundSize: aspectRatio === 43 ? 20 : vpx(21*screenRatio)
		property var buttonRoundTextSize: aspectRatio === 43 ? 12 : vpx(14*screenRatio)
		color: footerCSS.background
		width: footerCSS.width
		height: footerCSS.height

	anchors {
		bottom: main.bottom; bottomMargin: aspectRatio === 43 ? 12: vpx(-42*screenRatio)
		right: main.right
	}

	//Button A

		Rectangle {
		id: footer__legend_A
		width: buttonSize
		height: parent.height
		color: "transparent"

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? 12: vpx(85*screenRatio)
		verticalCenter: parent.verticalCenter
	}

	Rectangle {
		id: footer__full_button_A
		height: width
		width: vpx(50*screenRatio)
		color: "transparent"

	anchors {
		right: parent.right
		centerIn:  aspectRatio = 43 ? none : vpx(parent*screenRatio)
	}

	Rectangle {
		id: footer__button_A
		height: buttonRoundSize
		width: buttonRoundSize
		color: theme.title
		radius: buttonRoundSize

	anchors {
		verticalCenter: parent.verticalCenter
	}

	Text {
		text: "A"
		color: theme.background
		font.pixelSize: buttonRoundTextSize

		anchors {
			verticalCenter: parent.verticalCenter
			horizontalCenter: parent.horizontalCenter
		}

	}                  

}
                
	Text {
		text: "OK"
		color: theme.text
		font.pixelSize: buttonTextSize

			anchors {
				verticalCenter: parent.verticalCenter
				left: footer__button_A.right; leftMargin: aspectRatio === 43 ? 12: vpx(4*screenRatio)
			}

		}

	}

}
          
	//Button B

	Rectangle {
		id: footer__legend_B
		width: buttonSize
		height: parent.height
		color: "transparent"

	anchors {
		verticalCenter: parent.verticalCenter
		right: footer__legend_A.left
	}

	Rectangle {
		id: footer__full_button_B
		height: width
		width: vpx(50*screenRatio)
		color: "transparent"

	anchors {
		right: parent.right
		centerIn:  aspectRatio = 43 ? none : vpx(parent*screenRatio)
	}

	Rectangle {
		id: footer__button_B
		height: buttonRoundSize
		width: buttonRoundSize
		color: theme.title
		radius: buttonRoundSize
		visible: currentPage === 'Software' ? true : false

	anchors {
		verticalCenter: parent.verticalCenter
	}

	Text {
		text: "B"
		color: theme.background
		font.pixelSize: buttonRoundTextSize

		anchors {
			verticalCenter: parent.verticalCenter
			horizontalCenter: parent.horizontalCenter
		}

	}

}
            
	Text {
		text: "Back"
		color: theme.text
		font.pixelSize: buttonTextSize
		visible: currentPage === 'Software' ? 1 : 0

	anchors {
		left: footer__button_B.right; leftMargin: aspectRatio === 43 ? 12: vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	//Time status

	Text {
		id: footer__time
		text: Qt.formatTime(new Date(), "hh:mm")
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? 12 : vpx(16*screenRatio)

	anchors {
		verticalCenter: parent.verticalCenter
		left: parent.right; leftMargin: aspectRatio === 43 ? 12: vpx(85*screenRatio)
	}

	Timer {
		interval: 1000 //Run the timer every 1 second
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: footer__time.text = Qt.formatTime(new Date(), "hh:mm")
	}

}

}

}

}
import QtQuick 2.12


	Rectangle {
		id: footer
		property var buttonSize: aspectRatio === 43 ? 85 : 130*1.4
		property var buttonTextSize: aspectRatio === 43 ? 14 : 28*1.4
		property var buttonRoundSize: aspectRatio === 43 ? 20 : 42*1.4
		property var buttonRoundTextSize: aspectRatio === 43 ? 12 : 28*1.4
		color: footerCSS.background
		width: footerCSS.width
		height: footerCSS.height

	anchors {
		bottom: main.bottom; bottomMargin: aspectRatio === 43 ? 12: -90
		right: main.right; rightMargin: aspectRatio === 43 ? 12: 225
	}

	//Button A

		Rectangle {
		id: footer__legend_A
		width: buttonSize
		height: parent.height
		color: "transparent"

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? -20 : 40
		verticalCenter: parent.verticalCenter
	}

	Rectangle {
		id: footer__full_button_A
		height: width
		width: 100
		color: "transparent"

	anchors {
		right: parent.right
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
				left: footer__button_A.right; leftMargin: aspectRatio === 43 ? 12: 8
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
		width: 100
		color: "transparent"

	anchors {
		right: parent.right
		centerIn:  aspectRatio = 43 ? none : parent
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
		left: footer__button_B.right; leftMargin: aspectRatio === 43 ? 12: 8
		verticalCenter: parent.verticalCenter
	}

}

	//Time status

	Text {
		id: footer__time
		text: Qt.formatTime(new Date(), "hh:mm")
		color: theme.text
		font.pixelSize: buttonTextSize

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? 12 : -380
		verticalCenter: parent.verticalCenter
	}

	Timer {
		interval: 1000 // Run the timer every 1 second
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: footer__time.text = Qt.formatTime(new Date(), "hh:mm")
	}

}

}

}

}
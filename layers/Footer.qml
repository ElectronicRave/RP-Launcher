import QtQuick 2.12

	Rectangle {
		id: footer
		property var buttonSize: aspectRatio === 43 ? vpx(75*screenRatio) : vpx(65*screenRatio)
		property var buttonTextSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		property var buttonRoundSize: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		property var buttonRoundTextSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(16*screenRatio)
		width: footerCSS.width
		height: footerCSS.height
		color: footerCSS.background

	anchors {
		right: main.right
		bottom: main.bottom; bottomMargin: aspectRatio === 43 ? vpx(-38*screenRatio) : vpx(-33*screenRatio)
	}

	//Button A

		Rectangle {
		id: footer__legend_A
		width: buttonSize
		height: parent.height
		color: "transparent"

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(105*screenRatio) : vpx(85*screenRatio)
		verticalCenter: parent.verticalCenter
	}

	Rectangle {
		id: footer__full_button_A
		height: width
		width: aspectRatio === 43 ? vpx(50*screenRatio) : vpx(50*screenRatio)
		color: "transparent"

	anchors {
		right: parent.right
		centerIn:  aspectRatio = 43 ? vpx(none*screenRatio) : vpx(parent*screenRatio)
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
				left: footer__button_A.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
				verticalCenter: parent.verticalCenter

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
		width: aspectRatio === 43 ? vpx(50*screenRatio) : vpx(50*screenRatio)
		color: "transparent"

	anchors {
		right: parent.right
		centerIn:  aspectRatio = 43 ? vpx(none*screenRatio) : vpx(parent*screenRatio)
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
		left: footer__button_B.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	MouseArea {
		id: footer__full_button_B_mouse
		anchors.fill: footer__full_button_B
		onClicked: {
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			searchValue=''
			header__search_input.text=''
			navigate('Home')
			return
	}

}

	//Time status

	Text {
		id: footer__time
		text: Qt.formatTime(new Date(), "hh:mm")
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(16*screenRatio)

	anchors {
		left: parent.right; leftMargin: aspectRatio === 43 ? vpx(115*screenRatio) : vpx(85*screenRatio)
		verticalCenter: parent.verticalCenter

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
import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: footer
		width: footerCSS.width
		height: footerCSS.height
		color: footerCSS.background
		clip: true

	anchors {
		bottom: main.bottom; bottomMargin: aspectRatio === 43 ? vpx(-70*screenRatio) : vpx(-75*screenRatio)
	}

	//Button B

	Image {
		id: footer__button_b
		sourceSize.width: aspectRatio === 43 ? vpx(43*screenRatio) : vpx(36*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/button_b.svg"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true
		visible: currentPage === 'Software' ? 1 : 0

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(195*screenRatio) : vpx(170*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Text {
		id: footer__button_b_legend
		text: "Back"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		visible: currentPage === 'Software' ? 1 : 0

	anchors {
		left: footer__button_b.right; leftMargin: aspectRatio === 43 ? vpx(-4*screenRatio) : vpx(-4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	MouseArea {
		id: footer__button_b_mouse
		anchors.fill: footer__button_b_legend
		onClicked: {
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			searchValue=''
			navigate('Home')
			return
	}

}

	//Button A

	Image {
		id: footer__button_a
		sourceSize.width: aspectRatio === 43 ? vpx(43*screenRatio) : vpx(36*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/button_a.svg"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		left: footer__button_b_legend.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Text {
		id: footer__button_a_legend
		text: "OK"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)

	anchors {
		left: footer__button_a.right; leftMargin: aspectRatio === 43 ? vpx(-4*screenRatio) : vpx(-4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	//Time status

	Rectangle {
		id: time_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(45*screenRatio)
		height: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(28*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	Text {
		id: footer__time
		text: Qt.formatTime(new Date(), "hh:mm")
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(16*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		left: footer__button_a_legend.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		verticalCenter: parent.verticalCenter

	}

	KeyNavigation.up: gameView || systemListView

	Timer {
		id: footer__time_update
		interval: 1000 //Run the timer every 1 second
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: footer__time.text = Qt.formatTime(new Date(), "hh:mm")
	}

}

}
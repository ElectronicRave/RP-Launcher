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
		id: footer__button_b_img
		sourceSize.width: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(35*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/button_b.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true
		visible: currentPage === 'Software' ? 1 : 0

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(195*screenRatio) : vpx(170*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Rectangle {
		id: footer__button_b
		width: vpx(55)
		height: vpx(43)
		color: "transparent"
		visible: currentPage === 'Software' ? 1 : 0

	Text {
		id: footer__button_b_legend
		text: "Back"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(13*screenRatio)

	anchors {
		centerIn: footer__button_b
	}

}

	anchors {
		left: footer__button_b_img.right; leftMargin: aspectRatio === 43 ? vpx(-1*screenRatio) : vpx(-4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}


	MouseArea {
		id: footer__button_b_mouse
		anchors.fill: footer__button_b
		onClicked: {

		if (header__search_input.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

		else if (header__search_layout.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		else if (header__search_button_ok.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		else if (header__search_button_cancel.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		else if (personal__center_layout_down_button.focus) {
			profile_icon.focus = true
		}

		else if (personal__center_layout_icon.focus) {
			profile_icon.focus = true
		}

		else if (game__settings_layout.focus) {
			navigate('Software')
		}

		else if (game__settings_layout_favorite_button.focus) {
			navigate('Software')
		}

		else {
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			searchValue = ''
			navigate('Home')
		}

	}

}

	//Button A

	Image {
		id: footer__button_a_img
		sourceSize.width: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(35*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/button_a.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		left: footer__button_b.right; leftMargin: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Rectangle {
		id: footer__button_a
		width: vpx(35)
		height: vpx(43)
		color: "transparent"

	Text {
		id: footer__button_a_legend
		text: "OK"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(13*screenRatio)

	anchors {
		centerIn: footer__button_a
	}

}

	anchors {
		left: footer__button_a_img.right; leftMargin: aspectRatio === 43 ? vpx(-4*screenRatio) : vpx(-4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	//Time status

	Rectangle {
		id: time_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(43*screenRatio)
		height: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	Text {
		id: footer__time
		text: Qt.formatTime(new Date(), "hh:mm")
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(14*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		left: footer__button_a.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
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
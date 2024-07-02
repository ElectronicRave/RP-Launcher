import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: buttons

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

		if (header__search_layout.focus) {
			search.focus = true
		}

		else if (header__search_input.focus) {
			search.focus = true
		}

		else if (header__search_button_cancel.focus) {
			search.focus = true
		}

		else if (header__search_button_ok.focus) {
			search.focus = true
		}

		else if (game__settings_layout.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (game__settings_layout_favorite_button.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (personal__center_layout_icon.focus) {
			profile.focus = true
		}

		else if (personal__center_layout_down_button.focus) {
			profile.focus = true
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

	anchors {
		right: parent.right;
		verticalCenter: parent.verticalCenter
	}

}
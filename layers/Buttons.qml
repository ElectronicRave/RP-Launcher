import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: buttons

	//Button B

	Image {
		id: button_b_img
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
		id: button_b_layout
		width: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(28*screenRatio)
		height: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(23*screenRatio)
		color: "transparent"
		visible: currentPage === 'Software' ? 1 : 0

	Text {
		id: button_b_legend
		text: "Back"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(13*screenRatio)

	anchors {
		centerIn: button_b_layout
	}

}

	anchors {
		left: button_b_img.right; leftMargin: aspectRatio === 43 ? vpx(-1*screenRatio) : vpx(-4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}


	MouseArea {
		id: button_b_layout_mouse
		anchors.fill: button_b_layout
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
		id: button_a_img
		sourceSize.width: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(35*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/button_a.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		left: button_b_layout.right; leftMargin: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(6*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Rectangle {
		id: button_a_layout
		width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(18*screenRatio)
		height: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(23*screenRatio)
		color: "transparent"

	Text {
		id: button_a_legend
		text: "OK"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(13*screenRatio)

	anchors {
		centerIn: button_a_layout
	}

}

	anchors {
		left: button_a_img.right; leftMargin: aspectRatio === 43 ? vpx(-3*screenRatio) : vpx(-5*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	anchors {
		right: parent.right;
		verticalCenter: parent.verticalCenter
	}

}
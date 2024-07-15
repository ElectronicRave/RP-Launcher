import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: button_quit_layout
		width: aspectRatio === 43 ? vpx(60*screenRatio) : vpx(50*screenRatio)
		height: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(28*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	KeyNavigation.up: {
		if (currentPage === 'Home') {
			systemListView;
		}

		else if (currentPage === 'Software') {
			gameView;
		}

	}

	KeyNavigation.right: {
		if (currentPage === 'Home') {
			time;
		}

		else if (currentPage === 'Software') {
			time;
		}

	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (currentPage === 'Home') {
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			Qt.callLater(Qt.quit);
		}

		else if (currentPage === 'Software') {
			Qt.callLater(Qt.quit);
		}
			
		}

	}

	MouseArea {
		id: button_quit_layout_mouse
		anchors.fill: button_quit_layout

		onClicked: {

		if (currentPage === 'Home') {

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
		}

		else {
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			Qt.callLater(Qt.quit);
		}

		}

		else if (currentPage === 'Software') {

		if (header__search_layout.focus) {
			header__search_layout.focus = false
			header__search_input.focus = false
			header__search_button_cancel.focus = false
			header__search_button_ok.focus = false
		}

		else if (header__search_input.focus) {
			header__search_layout.focus = false
			header__search_input.focus = false
			header__search_button_cancel.focus = false
			header__search_button_ok.focus = false
		}

		else if (header__search_button_cancel.focus) {
			header__search_layout.focus = false
			header__search_input.focus = false
			header__search_button_cancel.focus = false
			header__search_button_ok.focus = false
		}

		else if (header__search_button_ok.focus) {
			header__search_layout.focus = false
			header__search_input.focus = false
			header__search_button_cancel.focus = false
			header__search_button_ok.focus = false
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
			navigate('Software')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Software')
		}

		else {
			Qt.callLater(Qt.quit);
		}

		}

		}

	}

	Text {
		id: button_quit_legend
		text: "Quit"
		color: theme.title
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(13*screenRatio)

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(2*screenRatio);
		verticalCenter: parent.verticalCenter
	}

}

	Image {
		id: button_quit_img
		sourceSize.width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/quit.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		left: parent.left;
		verticalCenter: parent.verticalCenter
	}

}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}
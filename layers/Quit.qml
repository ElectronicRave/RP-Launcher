import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: button_quit_layout
		width: aspectRatio === 43 ? vpx(60*screenRatio) : vpx(50*screenRatio)
		height: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(28*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	Text {
		id: button_quit_legend
		text: "Quit"
		color: theme.text
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
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			Qt.callLater(Qt.quit);
		}

		else if (currentPage === 'Software') {
			Qt.callLater(Qt.quit);
		}

		}

	}

}
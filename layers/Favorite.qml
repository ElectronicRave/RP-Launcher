import QtQuick 2.15

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(72*screenRatio) : vpx(65*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	Text {
		id: favorite_label
		text: "Favorite"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: all.right; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	KeyNavigation.left: {
		if (currentPage === 'Home') {
			all;
		}

		else if (currentPage === 'Software') {
			all;
		}

	}

	KeyNavigation.right: {
		if (currentPage === 'Home') {
			played;
		}

		else if (currentPage === 'Software') {
			played;
		}

	}

	KeyNavigation.down: {
		if (currentPage === 'Home') {
			systemListView;
		}

		else if (currentPage === 'Software') {
			gameView;
		}

	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			currentCollectionIndex = 0
			navigate('Software')
		}

	}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite_label
		onClicked: {
			searchValue = ''
			currentCollectionIndex = 0
			navigate('Software')
		}

	}

}
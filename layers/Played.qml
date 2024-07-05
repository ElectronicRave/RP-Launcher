import QtQuick 2.15

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(62*screenRatio) : vpx(53*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		if (currentPage === 'Home') {
			favorite;
		}

		else if (currentPage === 'Software') {
			favorite;
		}

	}

	KeyNavigation.right: {
		if (currentPage === 'Software') {
			search;
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

		if (currentPage === 'Home') {
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex)
			navigate('Software')
		}

		else if (currentPage === 'Software') {
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 1
			navigate('Software')
		}

		}

	}

	Text {
		id: played_label
		text: "Played"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: favorites.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	MouseArea {
		id: played_mouse
		anchors.fill: played_label

		onClicked: {

		if (currentPage === 'Home') {
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex)
			navigate('Software')
		}

		else if (currentPage === 'Software') {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 1
			navigate('Software')
		}

		}

	}

}
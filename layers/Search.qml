import QtQuick 2.15
import QtGraphicalEffects 1.12

	Rectangle {
		id: search_button
		width: aspectRatio === 43 ? vpx(64*screenRatio) : vpx(55*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)
		visible: currentPage === 'Software'

	Text {
		id: search_label
		text: "Search"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: played.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	KeyNavigation.left: {
		if (currentPage === 'Software') {
			played;
		}

	}

	KeyNavigation.down: {
		if (currentPage === 'Software') {
			gameView;
		}

	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

	}

	MouseArea {
		id: search_mouse
		anchors.fill: search_label
		onClicked: {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

	}

}
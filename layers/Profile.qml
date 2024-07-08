import QtQuick 2.15

	Rectangle {
		id: profile_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(35*screenRatio)
		height: width
		color: "#EBEBEB"
                border.color: focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)

	KeyNavigation.right: {
		if (currentPage === 'Home') {
			all;
		}

		else if (currentPage === 'Software') {
			all;
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

		if (currentPage === 'Home') {
			personal.focus = true
		}

		else if (currentPage === 'Software') {
			personal.focus = true
		}

		}

	}

	Image {
		id: profile_icon
		sourceSize.width: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(30*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.png"
		antialiasing: true
		smooth: true

	anchors {
		centerIn: profile_button
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
	}

	MouseArea {
		id: profile_icon_mouse
		anchors.fill: profile_button
		onClicked:{

		if (currentPage === 'Home') {
			personal.focus = true
		}

		else if (currentPage === 'Software') {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			personal.focus = true
		}

		}

	}
              
}
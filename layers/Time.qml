import QtQuick 2.15

	Rectangle {
		id: time_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(43*screenRatio)
		height: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(26*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	Text {
		id: time_legend
		text: Qt.formatTime(new Date(), "hh:mm")
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(14*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		right: buttons.right; rightMargin: aspectRatio === 43 ? vpx(22*screenRatio) : vpx(22*screenRatio)
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

	KeyNavigation.left: {

		if (currentPage === 'Home') {
			quit;
		}

		else if (currentPage === 'Software') {
			quit;
		}

	}

	Timer {
		id: time_update
		interval: 1000 //Run the timer every 1 second
		running: true
		repeat: true
		triggeredOnStart: true
		onTriggered: time_legend.text = Qt.formatTime(new Date(), "hh:mm")
	}

}
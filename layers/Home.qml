import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: home

	Rectangle {
		id: header
		width: headerCSS.width
		height: headerCSS.height
		color: headerCSS.background

	anchors {
		top: parent.top;
	}

	//Profile icon

	Profile {
		id: profile
	}

	//All games

	All {
		id: all
	}

	//Favorite games

	Favorite {
		id: favorites
	}

	//Played games

	Played {
		id: played
	}

	//Search games

	Search {
		id: search
	}

	//Battery status

	Battery {
		id: battery
	}

}

	Rectangle {
		id: main
		width: wrapperCSS.width
		height: mainCSS.height
		color: mainCSS.background

	anchors {
		top: header.bottom
	}

	Rectangle {
		id: system
		width: parent.width
		height: parent.height
		color: "transparent"
		clip: true

	ListView {
		id: systemListView
		model: allCollectionsHome
		snapMode: ListView.SnapOneItem
		delegate: systemDelegate
		orientation: ListView.Horizontal
		focus: currentPage === 'Home' ? true : false
		spacing: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: aspectRatio === 43 ? vpx(135*screenRatio) : vpx(95*screenRatio)
		preferredHighlightEnd: aspectRatio === 43 ? vpx(510*screenRatio) : vpx(590*screenRatio)
		highlightMoveDuration: 200
		highlightMoveVelocity: -1

	KeyNavigation.up: favorites;

	KeyNavigation.down: quit;

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(58*screenRatio) : vpx(48*screenRatio)
		left: parent.left
		right: parent.right
		bottom: parent.bottom
	}

	Component {
		id: systemDelegate
                  
	Item {
		id: system__item_container
		property bool selected: ListView.isCurrentItem
		property bool focused: ListView.isCurrentItem && systemListView.focus
		width: aspectRatio === 43 ? vpx(175*screenRatio) : vpx(122*screenRatio)
		height: width

	//Browse the collection and return to the same place after playing

	//Selecting the collection

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			currentCollectionIndex = system__item_container.ListView.view.currentIndex +2
			api.memory.set('currentCollectionIndex', currentCollectionIndex)
			navigate('Software')
		}

	}

	Text {
		id: system__item_title
		height: aspectRatio === 43 ? vpx(38*screenRatio) : vpx(24*screenRatio)
		text: modelData.name
		color: theme.accent
		font.pixelSize: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(17*screenRatio)
		font.bold: true
		opacity: focused ? 1 : 0

	anchors {
		horizontalCenter: system__item_container.horizontalCenter
	}

}

	Rectangle {
		id: system__item
		width: parent.width
		height: parent.height
		color: theme.background

	anchors {
		top : system__item_title.bottom
	}
  


	Image {
		id: system__logo
		height: parent.height
		width: parent.width
		fillMode: Image.PreserveAspect
		source: "../assets/images/logos/"+modelData.shortName+".jpg"
		asynchronous: true
		smooth: true
		visible: false
}

	OpacityMask {
		source: system__logo
		maskSource:

	Rectangle {
		width: system__logo.width
		height: system__logo.height
		radius: vpx(4*screenRatio)
		visible: true
	}

	anchors {
		fill: system__logo
	}

}

	MouseArea {
		id: system__logo_mouse
		anchors.fill: system__logo

		onClicked: {

		if (focused) {
			currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software')
		}

		else {
			systemListView.currentIndex = index
			api.memory.unset('currentCollectionIndex', currentCollectionIndex);
			navigate('Home')
		}

		}

	}

	Rectangle {
		id: system__item_highlight
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
		radius: vpx(4*screenRatio)
		opacity: focused ? 1 : 0

	anchors {
		centerIn: system__logo
	}

}

}

}

}

}

}

}

	//Personal center

	Personal {
		id: personal
	}

	Rectangle {
		id: footer
		width: footerCSS.width
		height: footerCSS.height
		color: footerCSS.background
		clip: true

	anchors {
		bottom: main.bottom; bottomMargin: aspectRatio === 43 ? vpx(-70*screenRatio) : vpx(-75*screenRatio)
	}

	//Buttons

	Quit {
		id: quit
	}

	Buttons {
		id: buttons
	}

	//Time status

	Time {
		id: time
	}

}

}
import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: home

	Rectangle {
		id: header
		width: headerCSS.width
		height: headerCSS.height
		color: headerCSS.background
		clip: true

	anchors {
		top: parent.top;
	}

	//Profile icon

	Rectangle {
		id: profile_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(36*screenRatio)
		height: width
		color: "#2C2C2C"
                border.color: focus ? theme.accent : theme.title
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(3*screenRatio)
		radius: 100

	Image {
		id: profile_icon
		sourceSize.width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(35*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.svg"
		antialiasing: true
		smooth: true

	anchors {
		centerIn: profile_button
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(16*screenRatio)
	}
              
	KeyNavigation.right: all_button;
	KeyNavigation.down: systemListView
              
	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			swapTheme()
	}
}

	MouseArea {
		id: profile_icon_mouse
		anchors.fill: profile_button
		onPressAndHold:{
			swapTheme()
	}

}

}

	//All games

	Rectangle {
		id: all_button
		width: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(30*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	Text {
		id: all_label
		text: "All"
		color: theme.accent
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		centerIn: parent
	}
}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: profile_button.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(48*screenRatio)
	}

	KeyNavigation.left: profile_button;
	KeyNavigation.right: favorite_button;
	KeyNavigation.down: systemListView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			searchValue = ""
			currentCollectionIndex = 2
			navigate('Software')
	}

}

	MouseArea {
		id: all_mouse
		anchors.fill: all_button
		onClicked: {
			searchValue = ""
			currentCollectionIndex = 2
			navigate('Software')
	}

}

}

	//Favorite games

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(72*screenRatio) : vpx(65*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: all_button.right; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	KeyNavigation.left: all_button;
	KeyNavigation.right: played_button;
	KeyNavigation.down: systemListView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			searchValue = ""
			currentCollectionIndex = 0
			navigate('Software')
	}
}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite_button
		onClicked: {
			searchValue = ""
			currentCollectionIndex = 0
			navigate('Software')
	}

}

}

	//Played games

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(62*screenRatio) : vpx(53*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1


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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: favorite_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	KeyNavigation.left: favorite_button;
	KeyNavigation.right: search_button;
	KeyNavigation.down: systemListView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			searchValue = ""
			currentCollectionIndex = 1
			navigate('Software')
	}
}

	MouseArea {
		id: played_mouse
		anchors.fill: played_button
		onClicked: {
			searchValue = ""
			currentCollectionIndex = 1
			navigate('Software')
	}

}

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

	ListView {
		id: systemListView
		model: api.collections
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

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(63*screenRatio) : vpx(48*screenRatio)
		left: parent.left
		right: parent.right
		bottom: parent.bottom
	}

	KeyNavigation.up: favorite_button;
	KeyNavigation.down: time_button

	Component {
		id: systemDelegate
                  
	Item {
		id: system__item_container
		property bool selected: ListView.isCurrentItem
		width: aspectRatio === 43 ? vpx(175*screenRatio) : vpx(122*screenRatio)
		height: width

	//Browse the collection and return to the same place after playing

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		event.accepted = true
		currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
		api.memory.set('currentCollectionIndex', currentCollectionIndex)
		navigate('Software')
	}

}

	Text {
		id: system__item_title
		text: modelData.name
		color: theme.accent
		font.pixelSize: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(17*screenRatio)
		font.bold: true
		height: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(28*screenRatio)
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight
		opacity: selected ? 1 : 0

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
		anchors.fill: system__logo
		source: system__logo
		maskSource:

	Rectangle {
		width: system__logo.width
		height: system__logo.height
		radius: vpx(4*screenRatio)
		visible: true
	}

}

	MouseArea {
		id: system__logo_mouse
		anchors.fill: system__logo
		onClicked: {
			if (selected) {
				currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
				api.memory.set('currentCollectionIndex', currentCollectionIndex)
				navigate('Software')
	}
			else
				systemListView.currentIndex = index
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
		opacity: selected ? 1 : 0

	anchors {
		centerIn: system__logo
	}

}

}

}

}

}

}
	Header {}

	Footer {}

}
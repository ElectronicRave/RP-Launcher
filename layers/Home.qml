import QtQuick 2.12


	Item {
		id: home

	Rectangle {
		id: header
		color: "transparent"
		width: headerCSS.width
		height: header_inner.height+header__border.height + aspectRatio === 43 ? 40 : vpx(60*screenRatio)
		clip: true

	anchors {
		top: parent.top;
	}

	Rectangle {
		id: header_inner
		color: "transparent"
		width: parent.width
		height: parent.height
}

}

	Rectangle {
		id: header__border
		width: parent.width
		height: aspectRatio === 43 ? 0 : vpx(0*screenRatio)
		color: "transparent"

	anchors {
		top: header_inner.bottom; topMargin: aspectRatio === 43 ? 3 : vpx(4*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : vpx(10*screenRatio)
	}

}

	Rectangle {
		id: main
		color: "transparent"
		width: wrapperCSS.width
		height: mainCSS.height

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
		spacing: vpx(10*screenRatio)

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: screenRatio === 43 ? 12: vpx(100*screenRatio)
		preferredHighlightEnd: screenRatio === 43 ? 12: vpx(580*screenRatio)
		highlightMoveDuration: 200
		highlightMoveVelocity: -1

	anchors {
		left: parent.left
		right: parent.right
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : vpx(32*screenRatio)
		bottom: parent.bottom
	}

		Keys.onLeftPressed: { decrementCurrentIndex() } 
		Keys.onRightPressed: { incrementCurrentIndex() }

	Component {
		id: systemDelegate
                  
	Item {
		id: system__item_container
		property bool selected: ListView.isCurrentItem
		width: aspectRatio === 43 ? 3 : vpx(135*screenRatio)
		height: width

	//Browse the collection and return to the same place after playing

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		event.accepted = true
		currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
		api.memory.set('currentCollectionIndex', currentCollectionIndex)
		navigate('Software')
		return
	}

}

	Text {
		id: system__item_title
		text: modelData.name
		color: theme.accent
		font.pixelSize: aspectRatio === 43 ? 14 : vpx(19*screenRatio)
		font.bold: true
		height: aspectRatio === 43 ? 3 : vpx(34*screenRatio)
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
		color: theme.buttons

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

	anchors {
		fill: parent
	}

}

	MouseArea {
		anchors.fill: system__logo
		onClicked: {
			if (selected) {
				currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
				api.memory.set('currentCollectionIndex', currentCollectionIndex)
				navigate('Software')
				return
	}
			else
				systemListView.currentIndex = index
	}

}

	Rectangle {
		id: system__item_border
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.accent
		border.width: screenRatio === 43 ? 3 : vpx(3*screenRatio)
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
import QtQuick 2.12
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

		Keys.onLeftPressed: { decrementCurrentIndex() } 
		Keys.onRightPressed: { incrementCurrentIndex() }

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
		return
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
				return
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
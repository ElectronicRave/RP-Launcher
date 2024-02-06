import QtQuick 2.12
import QtGraphicalEffects 1.12

	Item {
		id: home

	Rectangle {
		id: header
		color: "transparent"
		width: headerCSS.width
		height: header_inner.height+header__border.height + aspectRatio === 43 ? vpx(70*screenRatio) : vpx(60*screenRatio)
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
		height: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(0*screenRatio)
		color: "transparent"

	anchors {
		top: header_inner.bottom; topMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
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
		spacing: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: aspectRatio === 43 ? vpx(135*screenRatio) : vpx(100*screenRatio)
		preferredHighlightEnd: aspectRatio === 43 ? vpx(510*screenRatio) : vpx(580*screenRatio)
		highlightMoveDuration: 200
		highlightMoveVelocity: -1

	anchors {
		left: parent.left
		right: parent.right
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(73*screenRatio) : vpx(46*screenRatio)
		bottom: parent.bottom
	}

		Keys.onLeftPressed: { decrementCurrentIndex() } 
		Keys.onRightPressed: { incrementCurrentIndex() }

	Component {
		id: systemDelegate
                  
	Item {
		id: system__item_container
		property bool selected: ListView.isCurrentItem
		width: aspectRatio === 43 ? vpx(180*screenRatio) : vpx(135*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(19*screenRatio)
		font.bold: true
		height: aspectRatio === 43 ? vpx(44*screenRatio) : vpx(34*screenRatio)
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
		radius: 12
		visible: true
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
		border.width: aspectRatio === 43 ? vpx(3*screenRatio) : vpx(3*screenRatio)
		radius: 12
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
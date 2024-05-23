import QtQuick 2.12
import QtGraphicalEffects 1.12

	Item {
		id: software

	//Back to Home

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
		event.accepted = true
		api.memory.unset('currentCollectionIndex', currentCollectionIndex)
		searchValue = ""
		navigate('Home')
		return
	}

}

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

	Rectangle {
		id: game
		width: parent.width
		height: parent.height
		color: "transparent"
		visible: true
		clip: true

	GridView {
		id: gameView
		cellWidth: width / numcolumns
		cellHeight: cellWidth
		model: currentCollection.games
		snapMode: ListView.SnapOneItem
		delegate: gameViewDelegate
		focus: currentPage === 'Software' ? true : false
		clip: true

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(1*screenRatio)
		preferredHighlightEnd: aspectRatio === 43 ? vpx(0*screenRatio) : vpx(0*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(10*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(80*screenRatio) : vpx(100*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(70*screenRatio) : vpx(90*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(-5*screenRatio) : vpx(-5*screenRatio)
	}

		Keys.onUpPressed:       { moveCurrentIndexUp() }
		Keys.onDownPressed:     { moveCurrentIndexDown() }
		Keys.onLeftPressed:     { moveCurrentIndexLeft() }
		Keys.onRightPressed:    { moveCurrentIndexRight() }

	Component {
		id: gameViewDelegate

	Item {
		id: game__item_container
		property bool selected: GridView.isCurrentItem
		width: gameView.cellWidth - vpx(10*screenRatio)
		height: width

	//Launch game

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		event.accepted = true
		currentGameIndex = index
		currentGame.launch()
		return
}

	//We reset collection when going home

	if (api.keys.isCancel(event)) {
	api.memory.unset('currentCollectionIndex', currentCollectionIndex)
	return
}

	//Next page

	if (api.keys.isNextPage(event)) {
	event.accepted = true
	aspectRatio === 43 ? gameView.currentIndex = Math.min(gameView.currentIndex + 9, currentCollection.games.count - 1) : gameView.currentIndex = Math.min(gameView.currentIndex + 12, currentCollection.games.count - 1)
	return

}

	//Prev page

	if (api.keys.isPrevPage(event)) {
	event.accepted = true
	aspectRatio === 43 ? gameView.currentIndex = Math.max(gameView.currentIndex - 9, 0) : gameView.currentIndex = Math.max(gameView.currentIndex - 12, 0)
	return

}

	//Next collection

	if (api.keys.isPageDown(event)) {
	event.accepted = true
	currentCollectionIndex = currentCollectionIndex + 1
	return
}

	//Prev collection

	if (api.keys.isPageUp(event)) {
	event.accepted = true
	currentCollectionIndex = currentCollectionIndex - 1
	return

}

}

	Rectangle {
		id: game__item
		width: parent.width
		height: parent.height
		color: theme.buttons
		radius: vpx(5*screenRatio)
		z: -1
}

	Image {
		id: game__screenshot
		width: parent.width
		height: parent.height
		fillMode: Image.PreserveAspect
		source: modelData.assets.screenshots[0]
		asynchronous: true
		smooth: true
		visible: false

	anchors {
		fill: parent
	}

}

	OpacityMask {
		anchors.fill: game__screenshot
		source: game__screenshot
		maskSource:

	Rectangle {
		width: game__screenshot.width
		height: game__screenshot.height
		radius: vpx(5*screenRatio)
		visible: true
	}

}

	Image {
		id: game__logo
		width: parent.width
		height: parent.height
		source: modelData.assets.boxFront || modelData.assets.logo
		fillMode: Image.PreserveAspect
		asynchronous: true
		smooth: true
		z: -1
		visible: true

	anchors {
		fill: parent
		margins: aspectRatio === 43 ? vpx(27*screenRatio) : vpx(19*screenRatio)
	}

}
 
	MouseArea {
		id: game__item_mouse
		anchors.fill: game__item
		onClicked: {
			if (selected) {
				currentGameIndex = index
				currentGame.launch()
	}
			else
				gameView.currentIndex = index
	}
		onPressAndHold: {
			currentGameIndex = index
			currentGame.favorite = !currentGame.favorite
	}

}

	Rectangle {
		id: game__title_bar
		width: parent.width
		height: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(18*screenRatio)
		color: "transparent"
		radius: vpx(5*screenRatio)
		clip: true

	anchors {
		bottom: parent.bottom
	}

	Rectangle {
		id: game__title_bar_clipped
		width: parent.width
		height: game__title_bar.height + radius
		radius: game__title_bar.radius
		color: "#2C2C2C"
		opacity: 0.8

	anchors {
		bottom: parent.bottom
	}

}

	Text {
		id: game__title_name
		text: modelData.title
		color: "#FFFFFF"
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(13*screenRatio)
		elide: Text.ElideRight
		horizontalAlignment: Text.AlignHCenter
		visible: game__title_name_animation.visible ? 0 : 1

	anchors {
		fill: game__title_bar
	}

}

	Item {
		id: game__title_name_animation_item
		property alias text: game__title_name_animation.text
		property int spacing: aspectRatio === 43 ? vpx(60*screenRatio) : vpx(40*screenRatio)
  		width: game__title_name_animation.width + spacing
   		height: game__title_name_animation.height
  		clip: true

	Text {
		id: game__title_name_animation
		text: modelData.title
		color: "#FFFFFF"
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(13*screenRatio)
		visible: selected ? game__title_name.truncated : 0

	SequentialAnimation on x {
		running: selected ? game__title_name.truncated : 0
		loops: Animation.Infinite

	NumberAnimation {
		from: 0;
		to: - game__title_name_animation_item.width
		duration: 18 * Math.abs (to - from) //Speed at which text moves
	}

	PauseAnimation {
		duration: 1000 //Wait 1 second to continue
	}

}

	Text {
		id: game__title_name_animation_sequence
		x: game__title_name_animation_item.width
		text: game__title_name_animation.text
		color: game__title_name_animation.color
		font.pixelSize: game__title_name_animation.font.pixelSize
}

}

}

}

	Rectangle {
		id: game__item_border
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.title
		border.width: aspectRatio === 43 ? vpx(0.8*screenRatio) : vpx(0.8*screenRatio)
		visible: modelData.assets.screenshots[0] ? 1 : 0
		radius: vpx(5*screenRatio)

	anchors {
		fill: parent
	}

}

	Rectangle {
		id: game__item_highlight
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
		opacity: selected ? 1 : 0
		radius: vpx(5*screenRatio)

	anchors {
		fill: parent
	}

}

	//Favorite

	Canvas {
		id: game__favorite
		visible: modelData.favorite && currentCollection.shortName !== "all-favorites"

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(4*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(4*screenRatio)
	}

	Image {
		sourceSize.width: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: focus ? "../assets/icons/favorite.svg" : "../assets/icons/favorite.svg"
		antialiasing: true
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(4*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(4*screenRatio)
	}

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

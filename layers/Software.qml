import QtQuick 2.12
import QtGraphicalEffects 1.12

	Item {
		id: software

	//Back to Home

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
		event.accepted = true
		api.memory.unset('currentCollectionIndex', currentCollectionIndex)
		searchValue=''
		header__search_input.text=''
		navigate('Home')
		return
	}

}

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

	//Search content

	Rectangle {
		id: header__search
		color: theme.background
		width: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(120*screenRatio)
		height: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(26*screenRatio)
		border.color: theme.text
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1*screenRatio)
		radius: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(5*screenRatio)
		visible: searchValue

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(24*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(140*screenRatio) : vpx(165*screenRatio)
	}

	Rectangle {
		id: header__search_icon
		height:aspectRatio === 43 ? 16 : 32
		width:aspectRatio === 43 ? 16 : 32
		color: "transparent"

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		verticalCenter: parent.verticalCenter
	}

	Image {
		sourceSize.width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(20*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/search.svg"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.text }
		antialiasing: true
		smooth: true

	anchors {
		verticalCenter: parent.verticalCenter
		horizontalCenter: parent.horizontalCenter
	}

}

}              

	TextInput {
		id: header__search_input
		property var marginRight: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(22*screenRatio)
		width: parent.width - marginRight
		height: parent.height
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(15*screenRatio)
		clip: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(22*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(26*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio)
		verticalCenter: parent.verticalCenter
	}

	onTextEdited: {
		gameView.currentIndex = 0
		searchValue = header__search_input.text
		gameView.model = searchGames
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		navigate('Software')
		return
	}  
		if (event.key == Qt.Key_Down) {
		navigate('Software')
		return
	}

}

}
 
}

}

	Rectangle {
		id: header__border
		width: parent.width
		height: aspectRatio === 43 ? vpx(0*screenRatio) : vpx(0*screenRatio)
		color: "transparent"

	anchors {
		top: header_inner.bottom; topMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

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

	Rectangle {
		id: game
		color: "transparent"
		width: parent.width
		height: parent.height
		visible: true
		clip: true

	anchors {
		left: parent.left
		right: parent.right
		top: parent.top
		bottom: parent.bottom
	}

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
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(75*screenRatio) : vpx(70*screenRatio)
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(38*screenRatio) : vpx(13*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(65*screenRatio) : vpx(60*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(-6*screenRatio) : vpx(-6*screenRatio)
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
		color: modelData.assets.boxFront ? theme.buttons : theme.background
		radius: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(5*screenRatio)
		z: -2
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
		fill: game__item
	}

}


	OpacityMask {
		anchors.fill: game__screenshot
		source: game__screenshot
		maskSource:

	Rectangle {
		width: game__screenshot.width
		height: game__screenshot.height
		radius: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(5*screenRatio)
		visible: true
	}

}

	Image {
		id: game__logo
		width: parent.width
		height: parent.height
		source: modelData.assets.boxFront ? modelData.assets.boxFront : modelData.assets.logo
		fillMode: Image.PreserveAspect
		asynchronous: true
		smooth: true
		z: -1
		visible: true

	anchors {
		fill: parent
		margins: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(21*screenRatio)
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
		id: game__title
		width: parent.width
		height: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		color: "transparent"
		radius: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(5*screenRatio)
		clip: true

	anchors {
		bottom: parent.bottom
	}

	Rectangle {
		id: game__title_clipped
		width: parent.width
		height: game__title.height + radius
		radius: game__title.radius
		color: "#2C2C2C"
		opacity: 0.8

	anchors {
		bottom: parent.bottom
	}

	Text {
		id: game__title_name
		width: parent.width
		height: game__title
		text: modelData.title
		color: "#FFFFFF"
		font.family: titleFont.name
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(12*screenRatio)
		elide: Text.ElideRight
		horizontalAlignment: Text.AlignHCenter
		visible: selected ? 0 : 1

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(15*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(15*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(4*screenRatio)
	}

}

	Item {
		id: game__title_name_item
		property string text: modelData.title
		property string spacing: "     "
		property string combined: spacing + text + spacing
		property string display: combined.substring(step) + combined.substring(0, step)
		property int step: 0

	Text {
		id: game__title_name_animation
		width: parent.width
		height: game__title
		text: game__title_name_item.display
		color: "#FFFFFF"
		font.family: titleFont.name
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(12*screenRatio)
		horizontalAlignment: Text.AlignHCenter
		visible: selected ? 1 : 0
	}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(15*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(15*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(22.2*screenRatio) : vpx(16.7*screenRatio)
	}

	Timer {
		id: game__title_name_animation_timer
		interval: 300
		running: selected ? game__title_name.truncated : 0
		repeat: true
		onTriggered: parent.step = (parent.step + 1) % parent.combined.length
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
		radius: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(5*screenRatio)
		z: 1

	anchors {
		centerIn: parent
	}

}

	Rectangle {
		id: game__item_highlight
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		opacity: selected ? 1 : 0
		radius: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(5*screenRatio)
		z: 1

	anchors {
		centerIn: parent
	}

}

	//Favorite

	Canvas {
		id: game__favorite
		visible: modelData.favorite && currentCollection.shortName !== "all-favorites"

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
	}

	Image {
		sourceSize.width: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: focus ? "../assets/icons/favorite.svg" : "../assets/icons/favorite.svg"
		antialiasing: true
		smooth: true

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(4*screenRatio)
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(4*screenRatio)
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
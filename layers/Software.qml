import QtQuick 2.12


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
		height: header_inner.height+header__border.height+aspectRatio === 43 ? 40 : 120
		clip: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 15
	}

	Rectangle {
		id: header_inner
		color: "transparent"
		width: parent.width-60
		height: aspectRatio === 43 ? 40 : 110

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 5
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 30
	}         

	//Search games and softwares

	Rectangle {
		id: header__search
		color: theme.background
		width: aspectRatio === 43 ? 200 : 300
		height: aspectRatio === 43 ? 30 : 60
		border.color: theme.text
		border.width: 3
		visible: searchValue

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 48
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 470
	}

	TextInput {
		property var marginRight: aspectRatio === 43 ? 40 : 50

		id: header__search_input
		clip: true
		width: parent.width-marginRight
		height: parent.height
		color: theme.text
		font.pixelSize: screenRatio === 43 ? 14 : 36

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 8 : 52
		left: parent.left; leftMargin: aspectRatio === 43 ? 6 : 29
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
		width: parent.width-40
		height: aspectRatio === 43 ? 0 : 0
		color: "transparent"

	anchors {
		top: header_inner.bottom; topMargin: aspectRatio === 43 ? 3 : 8
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 20
	}

}

}

	Rectangle {
		id: main
		color: "transparent"
		width: wrapperCSS.width
		height: mainCSS.height-20

	anchors {
		top: header.bottom
	}

	Rectangle {
		id: game
		visible: true
		clip: true
		color: "transparent"
		width: parent.width
		height: parent.height

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
		preferredHighlightBegin: screenRatio === 43 ? 12: 1
		preferredHighlightEnd: screenRatio === 43 ? 12: 0

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 180
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 60
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 160
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? 3 : -20
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
		width: gameView.cellWidth -23
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

	//Next collection

	if (api.keys.isNextPage(event)) {
	event.accepted = true
	currentCollectionIndex = currentCollectionIndex+1
	return
}

	//Prev collection

	if (api.keys.isPrevPage(event)) {
	event.accepted = true
	currentCollectionIndex = currentCollectionIndex-1
	return
}

}

	Rectangle {
		id: game__item
		width: parent.width
		height: parent.height
		color: theme.buttons
}

	Image {
		id: game__screenshot
		width: parent.width
		height: parent.height
		fillMode: Image.PreserveAspect
		source: modelData.assets.screenshots[0]
		asynchronous: true
		smooth: true
		z: 1

	anchors {
		fill: parent
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

	anchors {
		fill: parent
		margins: 68
	}

}
 
	MouseArea {
		anchors.fill: game__screenshot && game__logo
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
		id: game__item_border
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.accent
		border.width: screenRatio === 43 ? 3 : 10
		opacity: selected ? 1 : 0
		z: 7

	anchors {
		centerIn: game__screenshot && game__logo
	}

}

	//Favorite

	Canvas {
		id: game__favorite
		visible: modelData.favorite && currentCollection.shortName !== "all-favorites"
		z: 1

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 12
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 12
	}

	Image {
		width: 56
		fillMode: Image.PreserveAspectFit
		source: focus ? "../assets/icons/favorite.png" : "../assets/icons/favorite.png"
		asynchronous: true
		smooth: true

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 8
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 8
	}

}

}

	Rectangle {
		id: game__title
		color: "#2C2C2C"
		width: parent.width
		height: screenRatio === 43 ? 3 : 60
		opacity: 0.8
		z: 1

	anchors {
		bottom: parent.bottom
		left: parent.left
		right: parent.right
		horizontalCenter: parent.horizontalCenter
	}

	Text {
		id: game__title_name
		text: modelData.title
		color: "#EBEBEB"
		font.family: titleFont.name
		font.bold: true
		font.pixelSize: screenRatio === 43 ? 14 : 34
		elide: Text.ElideRight
		horizontalAlignment: Text.AlignHCenter

	anchors { 
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? 3 : 12
		left: parent.left
		right: parent.right
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
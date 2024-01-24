import QtQuick 2.12


	Item {
		id: software
		property var itemWidth : 380
		property var itemHeight : itemWidth

	//Back to Home
	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
		event.accepted = true;
		api.memory.unset('currentCollectionIndex', currentCollectionIndex);
		searchValue='';
		header__search_input.text='';
		navigate('Home');
		return;
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
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 5;
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 30
	}         

	Rectangle {
		id: header__search
		color: theme.background
		width: aspectRatio === 43 ? 200 : 300
		height: aspectRatio === 43 ? 30 : 60
		border.color: theme.text
		border.width: 3
		visible: searchValue

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 26;
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 500
	}

	TextInput {
		property var marginRight: aspectRatio === 43 ? 40 : 100

		id: header__search_input
		clip: true
		width: parent.width-marginRight
		height: parent.height
		color: theme.text
		font.bold: true
		font.pixelSize: vpx(10*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 8 : 44;
		left: parent.left; leftMargin: aspectRatio === 43 ? 6  : 24;
		verticalCenter: parent.verticalCenter
	}

	onTextEdited: {
		gameView.currentIndex = 0;
		searchValue = header__search_input.text;
		gameView.model = searchGames;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		navigate('Software');
		return;
	}  
		if (event.key == Qt.Key_Down) {
		navigate('Software');  
		return;
	}

}

}
 
}

}

	Rectangle {
		id: header__border
		width: parent.width-40
		height: 0
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
		id: games
		visible: true
		clip: true
		color: "transparent"
		width: parent.width
		height: parent.height

	anchors {
		left: parent.left
		top: parent.top
		bottom: parent.bottom
	}

	GridView {
		id: gameView
		width: parent.width
		height: parent.height
		cellWidth: itemWidth
		cellHeight: itemHeight
		model: currentCollection.games
		snapMode: ListView.SnapOneItem
		delegate: gameViewDelegate
		focus: currentPage === 'Software' ? true : false

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: 1
		preferredHighlightEnd: 0

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 200
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 72
		right: parent.right
		bottom: parent.bottom
	}

		Keys.onUpPressed:       { moveCurrentIndexUp(); }
		Keys.onDownPressed:     { moveCurrentIndexDown(); }
		Keys.onLeftPressed:     { moveCurrentIndexLeft(); }
		Keys.onRightPressed:    { moveCurrentIndexRight(); }

	Component {
		id: gameViewDelegate

	Item {
		id: delegateContainer
		property bool selected: GridView.isCurrentItem
		width: itemWidth
		height: itemHeight

	//Launch game
	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		event.accepted = true;
		currentGameIndex = index;
		currentGame.launch();
		return;
}

	//We reset collection when going home
		if (api.keys.isCancel(event)) {
		api.memory.unset('currentCollectionIndex', currentCollectionIndex);
		return;
	}

	//Next collection
		if (api.keys.isNextPage(event)) {
		event.accepted = true;
		currentCollectionIndex = currentCollectionIndex+1;
		return;
	}

	//Prev collection
		if (api.keys.isPrevPage(event)) {
		event.accepted = true;
		currentCollectionIndex = currentCollectionIndex-1;
		return;
	}

}

	Rectangle {
		width: itemWidth-8
		height: itemHeight-8
		clip: true

	Rectangle {
		id:game__inner_border
		width: parent.width
		height: parent.height
		color: theme.buttons

	anchors {
		horizontalCenter: parent.horizontalCenter
		verticalCenter: parent.verticalCenter
	}

}

	Image {
		id: game_screenshot
		width: itemWidth
		height: itemHeight
		source: modelData.assets.screenshots[0]
		fillMode: Image.PreserveAspect
		asynchronous: true
		smooth: true
		z: 1

	anchors {
		fill: parent
	}

}

	Image {
		id: gamelogo
		width: parent.width
		height: parent.height
		source: modelData.assets.boxFront ? modelData.assets.boxFront : modelData.assets.logo
		fillMode: Image.PreserveAspect
		asynchronous: true
		smooth: true

	anchors {
		fill: parent
		margins: 72
	}

}
 
	MouseArea {
		anchors.fill: game_screenshot
		onClicked: {
			if (selected) {
				currentGameIndex = index;
				currentGame.launch();
	}
			else
				gameView.currentIndex = index;
	}
		onPressAndHold: {
			//Add to Favorites
			currentGameIndex = index;
			currentGame.favorite = !currentGame.favorite;
	}

}

	Rectangle {
		id: game__is_selected
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: selected ? theme.accent : wrapperCSS.background
		border.width: 8
		z: 7

	anchors {
		centerIn: screenshot
	}

}

	Canvas {
		id: game__is_fav
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
		antialiasing: true

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 8
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 8
	}

}

}

}

	Rectangle {
		id: game__title
		color: "#2C2C2C"
		width: gameTitle.contentWidth
		height: 60
		opacity: 0.8

	anchors {
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? 3 : 15
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 8
		right: parent.right; rightMargin: aspectRatio === 43 ? 3 : 16
		horizontalCenter: parent.horizontalCenter
	}

	Text {
		id: game__title_name
		text: modelData.title
		color: "#EBEBEB"
		font.family: titleFont.name
		font.bold: true
		font.pixelSize: vpx(12*screenRatio)
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
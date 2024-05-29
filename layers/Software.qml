import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: software

	//Back to Home

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
		event.accepted = true
		all_label.color = theme.accent
		all_label.font.bold = true
		favorite_label.color = theme.text
		favorite_label.font.bold = false
		played_label.color = theme.text
		played_label.font.bold = false
		search_label.color = theme.text
		search_label.font.bold = false
		api.memory.unset('currentCollectionIndex', currentCollectionIndex)
		searchValue = ""
		header__search_input.clear()
		navigate('Home')
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

	//Profile icon

	Rectangle {
		id: profile_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(36*screenRatio)
		height: width
		color: "#2C2C2C"
                border.color: focus ? theme.accent : theme.title
		border.width: 3
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
	KeyNavigation.down: gameView
              
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
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(30*screenRatio)
		height: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(32*screenRatio)
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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(18*screenRatio)
		left: profile_button.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(48*screenRatio)
	}

	KeyNavigation.left: profile_button;
	KeyNavigation.right: favorite_button;
	KeyNavigation.down: gameView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			all_label.color = theme.accent
			all_label.font.bold = true
			favorite_label.color = theme.text
			favorite_label.font.bold = false
			played_label.color = theme.text
			played_label.font.bold = false
			search_label.color = theme.text
			search_label.font.bold = false
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 2
			navigate('Software')
	}

}

	MouseArea {
		id: all_mouse
		anchors.fill: all_button
		onClicked: {
			all_label.color = theme.accent
			all_label.font.bold = true
			favorite_label.color = theme.text
			favorite_label.font.bold = false
			played_label.color = theme.text
			played_label.font.bold = false
			search_label.color = theme.text
			search_label.font.bold = false
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 2
			navigate('Software')
	}

}

}

	//Favorite games

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(65*screenRatio)
		height: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(32*screenRatio)
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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(18*screenRatio)
		left: all_button.right; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	KeyNavigation.left: all_button;
	KeyNavigation.right: played_button;
	KeyNavigation.down: gameView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			all_label.color = theme.text
			all_label.font.bold = false
			favorite_label.color = theme.accent
			favorite_label.font.bold = true
			played_label.color = theme.text
			played_label.font.bold = false
			search_label.color = theme.text
			search_label.font.bold = false
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 0
			navigate('Software')
	}
}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite_button
		onClicked: {
			all_label.color = theme.text
			all_label.font.bold = false
			favorite_label.color = theme.accent
			favorite_label.font.bold = true
			played_label.color = theme.text
			played_label.font.bold = false
			search_label.color = theme.text
			search_label.font.bold = false
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 0
			navigate('Software')
	}

}

}

	//Played games

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(53*screenRatio)
		height: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(32*screenRatio)
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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(18*screenRatio)
		left: favorite_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	KeyNavigation.left: favorite_button;
	KeyNavigation.right: search_button;
	KeyNavigation.down: gameView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			all_label.color = theme.text
			all_label.font.bold = false
			favorite_label.color = theme.text
			favorite_label.font.bold = false
			played_label.color = theme.accent
			played_label.font.bold = true
			search_label.color = theme.text
			search_label.font.bold = false
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 1
			navigate('Software')
	}
}

	MouseArea {
		id: played_mouse
		anchors.fill: played_button
		onClicked: {
			all_label.color = theme.text
			all_label.font.bold = false
			favorite_label.color = theme.text
			favorite_label.font.bold = false
			played_label.color = theme.accent
			played_label.font.bold = true
			search_label.color = theme.text
			search_label.font.bold = false
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 1
			navigate('Software')
	}

}

}
	//Search content

	Rectangle {
		id: search_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(55*screenRatio)
		height: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1
		visible: currentPage === 'Software' ? 1 : 0 ;

	Text {
		id: search_label
		text: "Search"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		visible: currentPage === 'Software' ? 1 : 0 ;

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(18*screenRatio)
		left: played_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	KeyNavigation.left: played_button;
	KeyNavigation.down: gameView

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			all_label.color = theme.text
			all_label.font.bold = false
			favorite_label.color = theme.text
			favorite_label.font.bold = false
			played_label.color = theme.text
			played_label.font.bold = false
			search_label.color = theme.accent
			search_label.font.bold = true
			searchValue = ""
			header__search_input.clear()
			header__search_input.focus = true
	}
}

	MouseArea {
		id: search_mouse
		anchors.fill: search_button
		onClicked: {
			all_label.color = theme.text
			all_label.font.bold = false
			favorite_label.color = theme.text
			favorite_label.font.bold = false
			played_label.color = theme.text
			played_label.font.bold = false
			search_label.color = theme.accent
			search_label.font.bold = true
			searchValue = ""
			header__search_input.clear()
			header__search_input.focus = true
	}

}

}

	Rectangle {
		id: header__search
		color: theme.background
		width: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(120*screenRatio)
		height: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(26*screenRatio)
		border.color: theme.text
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1*screenRatio)
		radius: vpx(5*screenRatio)
		visible: searchValue || header__search_input.focus

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(22*screenRatio)
		left: search_button.right; leftMargin: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(56*screenRatio)
	}


	Image {
		id: header__search_icon
		sourceSize.width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(20*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/search.svg"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.text }
		antialiasing: true
		smooth: true

	anchors {
		left: header__search.left; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		verticalCenter: header__search.verticalCenter
	}

}              

	TextInput {
		id: header__search_input
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(15*screenRatio)
		clip: true

	anchors {
		left: header__search_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		right: header__search.right; rightMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio)
		verticalCenter: header__search.verticalCenter
	}

	onTextEdited: {
		searchValue = header__search_input.text
		gameView.model = searchGames
		gameView.currentIndex = 0
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		navigate('Software')
	}  
        if (event.key === Qt.Key_Down) {
		navigate('Software')
	}

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

	KeyNavigation.up: profile_button;
	KeyNavigation.down: time_button

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
}

	//We reset collection when going home

	if (api.keys.isCancel(event)) {
	api.memory.unset('currentCollectionIndex', currentCollectionIndex)
}

	//Next page

	if (api.keys.isNextPage(event)) {
	event.accepted = true
	aspectRatio === 43 ? gameView.currentIndex = Math.min(gameView.currentIndex + 9, currentCollection.games.count - 1) : gameView.currentIndex = Math.min(gameView.currentIndex + 12, currentCollection.games.count - 1)

}

	//Prev page

	if (api.keys.isPrevPage(event)) {
	event.accepted = true
	aspectRatio === 43 ? gameView.currentIndex = Math.max(gameView.currentIndex - 9, 0) : gameView.currentIndex = Math.max(gameView.currentIndex - 12, 0)

}

	//Next collection

	if (api.keys.isPageDown(event)) {
	event.accepted = true
	currentCollectionIndex = currentCollectionIndex + 1
}

	//Prev collection

	if (api.keys.isPageUp(event)) {
	event.accepted = true
	currentCollectionIndex = currentCollectionIndex - 1

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

import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: software

	//Back to Home

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
			event.accepted = true
			gameView.visible = true
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			header__search_input.text = 'Search'
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			navigate('Home')
		}

	}

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
		id: favorite
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

	//Search component

	Rectangle {
		id: header__search_layout
		color: theme.background
		width: aspectRatio === 43 ? vpx(270*screenRatio) : vpx(250*screenRatio)
		height: aspectRatio === 43 ? vpx(170*screenRatio) : vpx(150*screenRatio)
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: vpx(3*screenRatio)
		visible: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus ? 1 : 0

	Keys.onDownPressed: {
		header__search_button_cancel.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			search.focus = true
			gameView.visible = false
		}

	}

	Text {
		id: header__search_layout_label
		color: theme.text
		text: "Search Content"
		font.pixelSize: aspectRatio === 43 ? vpx(19*screenRatio) : vpx(18*screenRatio)
		font.bold: true

	anchors {
		top: header__search_layout.top; topMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio);
		horizontalCenter: header__search_layout.horizontalCenter;
	}

}

	Rectangle {
		id: header__search
		color: theme.background
		width: aspectRatio === 43 ? vpx(150*screenRatio) : vpx(140*screenRatio)
		height: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(28*screenRatio)
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: vpx(5*screenRatio)

	anchors {
		centerIn: header__search_layout
	}


	Image {
		id: header__search_icon
		sourceSize.width: aspectRatio === 43 ? vpx(22*screenRatio) : vpx(20*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/search.png"
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
		color: searchValue ? theme.text : "grey"
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		clip: true

	Keys.onDownPressed: {
		if (searchValue) {
			header__search_button_cancel.focus = true
		}

		else if (header__search_input.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_button_cancel.focus = true
		}

	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (searchValue) {
			header__search_layout.focus = true
		}

		else {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

		}

		if (api.keys.isCancel(event)) {
			event.accepted = true

		if (searchValue) {
			header__search_layout.focus = true
		}

		else {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

	}

}

	anchors {
		left: header__search_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		right: header__search.right; rightMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio)
		verticalCenter: header__search.verticalCenter
	}

	onTextEdited: {
		searchValue = header__search_input.text
	}

}

	MouseArea {
		id: header__search_input_mouse
		anchors.fill: header__search_input

		onClicked: {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

	}

 
}

	Rectangle {
		id: header__search_button_cancel
		width: aspectRatio === 43 ? vpx(52*screenRatio) : vpx(52*screenRatio)
		height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	Keys.onUpPressed: {
		searchValue = ''
		header__search_input.clear()
		header__search_input.focus = true
	}

	Keys.onRightPressed: {
		header__search_button_ok.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			search.focus = true
			gameView.visible = false
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			search.focus = true
			gameView.visible = false
		}

	}

	Text {
		id: header__search_button_cancel_label
		text: "Cancel"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		font.bold: true

	anchors {
		centerIn: parent
	}

}

	anchors {
		bottom: header__search_layout.bottom; bottomMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio)
		right: header__search_layout.right; rightMargin: aspectRatio === 43 ? vpx(45*screenRatio) : vpx(45*screenRatio)
	}

	MouseArea {
		id: header__search_button_cancel_mouse
		anchors.fill: header__search_button_cancel

		onClicked: {
			searchValue = ''
			header__search_input.text = 'Search'
			search.focus = true
		}

	}

}

	Rectangle {
		id: header__search_button_ok
		width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	Keys.onUpPressed: {
		searchValue = ''
		header__search_input.clear()
		header__search_input.focus = true
	}

	Keys.onLeftPressed: {
		header__search_button_cancel.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (searchValue) {
			event.accepted = true
			currentCollectionIndex = 2
			gameView.model = searchGames
			gameView.currentIndex = 0
			navigate('Software')
			search.focus = true
			gameView.visible = true
		}

		else {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			search.focus = true
			gameView.visible = false
		}

	}

	Text {
		id: header__search_button_ok_label
		text: "OK"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		centerIn: parent
	}

}

	anchors {
		bottom: header__search_layout.bottom; bottomMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio)
		left: header__search_button_cancel.right; leftMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(8*screenRatio)
	}

	MouseArea {
		id: header__search_button_ok_mouse
		anchors.fill: header__search_button_ok

		onClicked: {

		if (searchValue) {
			currentCollectionIndex = 2
			gameView.model = searchGames
			gameView.currentIndex = 0
			navigate('Software')
			search.focus = true
			gameView.visible = true
		}

		else {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

		}

	}

}


	anchors {
		top: header.bottom; topMargin: aspectRatio === 43 ? vpx(85*screenRatio) : vpx(55*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(185*screenRatio) : vpx(215*screenRatio);
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
		clip: true
		
	GridView {
		id: gameView
		cellWidth: width / numcolumns
		cellHeight: aspectRatio === 43 ? cellWidth + 4 : cellWidth + 7
		model: currentCollection.games
		snapMode: ListView.SnapOneItem
		delegate: gameViewDelegate
		focus: currentPage === 'Software' ? true : false

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(1*screenRatio)
		preferredHighlightEnd: aspectRatio === 43 ? vpx(0*screenRatio) : vpx(0*screenRatio)

	KeyNavigation.up: profile;

	KeyNavigation.down: quit;

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(80*screenRatio) : vpx(100*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(70*screenRatio) : vpx(90*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(-5*screenRatio) : vpx(-5*screenRatio)
	}

	Component {
		id: gameViewDelegate

	Item {
		id: game__item_container
		property bool selected: GridView.isCurrentItem
		property bool focused: GridView.isCurrentItem && gameView.focus
		width: gameView.cellWidth - vpx(12*screenRatio)
		height: width
		scale: focused ? 1.07 : 1

	//Launch game

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			currentGameIndex = index
			currentGame.launch()
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
		radius: vpx(4*screenRatio)
}

	Image {
		id: game__logo
		width: parent.width
		height: parent.height
		source: modelData.assets.boxFront || modelData.assets.logo
		fillMode: Image.PreserveAspect
		asynchronous: true
		smooth: true
		visible: false

	anchors {
		fill: game__item
		margins: aspectRatio === 43 ? vpx(27*screenRatio) : vpx(19*screenRatio)
	}

}

	OpacityMask {
		source: game__logo
		maskSource:

	Rectangle {
		width: game__logo.width
		height: game__logo.height
		radius: vpx(4*screenRatio)
		visible: true
	}

	anchors {
		fill: game__logo
	}

}

	MouseArea {
		id: game__item_mouse
		anchors.fill: game__item

		onPressAndHold: {

		if (game__settings_layout.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			currentGameIndex = index
		}

		else if (game__settings_layout_favorite_button.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			currentGameIndex = index
		}

		else if (focused) {
			currentGameIndex = index
			game__settings_layout.focus = true
		}

		else {
			gameView.currentIndex = index
			currentGameIndex = index
			game__settings_layout.focus = true
		}

		}

		onClicked: {

		if (game__settings_layout.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			currentGameIndex = index
		}

		else if (game__settings_layout_favorite_button.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			currentGameIndex = index
		}

		else if (focused) {
			currentGameIndex = index
			currentGame.launch()
		}

		else  {
			gameView.currentIndex = index
			navigate('Software')
		}

		}

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
		source: game__screenshot
		maskSource:

	Rectangle {
		width: game__screenshot.width
		height: game__screenshot.height
		radius: vpx(4*screenRatio)
		visible: true
	}

	anchors {
		fill: game__screenshot
	}

}


	Rectangle {
		id: game__title_bar
		width: parent.width
		height: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(18*screenRatio)
		color: "transparent"
		radius: vpx(4*screenRatio)
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
		visible: focused ? game__title_name.truncated : 0

	SequentialAnimation on x {
		running: focused ? game__title_name.truncated : 0
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
		radius: vpx(4*screenRatio)

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
		radius: vpx(4*screenRatio)
		opacity: focused ? 1 : 0

	anchors {
		fill: parent
	}

}

	//Favorite icon

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
		source: "../assets/icons/favorite_icon.png"
		antialiasing: true
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(2*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(2*screenRatio)
	}

}

}

}

}

	//Game settings

	Rectangle {
		id: game__settings_layout
		width: aspectRatio === 43 ? vpx(230*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(120*screenRatio) : vpx(120*screenRatio)
		color: theme.background
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		visible: game__settings_layout.focus || game__settings_layout_favorite_button.focus ? 1 : 0

	Keys.onUpPressed: {
		game__settings_layout_favorite_button.focus = true
	}

	Keys.onLeftPressed: {
		game__settings_layout_favorite_button.focus = true
	}

	Keys.onRightPressed: {
		game__settings_layout_favorite_button.focus = true
	}

	Keys.onDownPressed: {
		game__settings_layout_favorite_button.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (game__settings_layout.focus) {
			game__settings_layout_favorite_button.focus = true
		}

		else {
			currentGame.favorite = !currentGame.favorite
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

	}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

	}

	Text {
		id: game__settings_layout_label
		text: "Game Settings"
		color: theme.text
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(16*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		horizontalCenter: parent.horizontalCenter
	}

}

	Rectangle {
		id: game__settings_layout_line
		width: game__settings_layout.width
		height: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		color: theme.text
 
	anchors {
		top: game__settings_layout_label.bottom; topMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		horizontalCenter: game__settings_layout.horizontalCenter
	}

}

	Rectangle {
		id: game__settings_layout_favorite_button
		width: aspectRatio === 43 ? vpx(226*screenRatio) : vpx(226*screenRatio)
		height: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(30*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : "transparent"
		border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)
		visible: game__settings_layout.focus || game__settings_layout_favorite_button.focus ? 1 : 0

	Image {
		id: game__settings_layout_favorite_image
		sourceSize.width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(22*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/favorite_menu.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio);
		verticalCenter: parent.verticalCenter;
	}

}

	Text {
		id: game__settings_layout_favorite_set_label
		text: "Set Favorite"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		visible: currentGame.favorite ? 0 : 1

	anchors {
		left: game__settings_layout_favorite_image.right; leftMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio);
		verticalCenter: parent.verticalCenter
	}
}

	Text {
		id: game__settings_layout_favorite_unset_label
		text: "Set Un Favorite"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		visible: currentGame.favorite ? 1 : 0

	anchors {
		left: game__settings_layout_favorite_image.right; leftMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio);
		verticalCenter: parent.verticalCenter
	}
}
	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(2*screenRatio);
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(25*screenRatio);
	}

}

	anchors {
		centerIn: parent
	}


	MouseArea {
		id: game__settings_layout_favorite_button_mouse
		anchors.fill: game__settings_layout_favorite_button

		onClicked:{
			currentGame.favorite = !currentGame.favorite
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false

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
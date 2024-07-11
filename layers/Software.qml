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

	Rectangle {
		id: profile_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(35*screenRatio)
		height: width
		color: "#FFFFFF"
                border.color: focus || personal__center_layout_up.focus || personal__center_layout_icon.focus || personal__center_layout_down_button.focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)

	KeyNavigation.right: {
		all;
	}

	KeyNavigation.down: {
		gameView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			personal__center_layout_icon.focus = true
		}

	}

	Image {
		id: profile_icon
		sourceSize.width: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(30*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.png"
		antialiasing: true
		smooth: true

	anchors {
		centerIn: profile_button
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
	}

	MouseArea {
		id: profile_icon_mouse
		anchors.fill: profile_button

		onClicked:{
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			personal__center_layout_icon.focus = true
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
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		profile_button;
	}

	KeyNavigation.right: {
		favorite;
	}

	KeyNavigation.down: {
		gameView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

	}

	Text {
		id: all_label
		text: "All"
		color: currentCollectionIndex === 0 || currentCollectionIndex === 1 || header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus || searchValue ? theme.text : theme.accent
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		font.bold: currentCollectionIndex === 0 || currentCollectionIndex === 1 || header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus || searchValue ? false : true

	anchors {
		centerIn: parent
	}
}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: profile_button.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(48*screenRatio)
	}

	MouseArea {
		id: all_mouse
		anchors.fill: all_label

		onClicked: {
			
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

	}

}

	//Favorite games

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(74*screenRatio) : vpx(67*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		all_button;
	}

	KeyNavigation.right: {
		played;
	}

	KeyNavigation.down: {
		gameView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 0
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

	}

	Text {
		id: favorite_label
		text: "Favorite"
		color: currentCollectionIndex === 0 ? theme.accent : theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		font.bold: currentCollectionIndex === 0 ? true : false

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: all_button.right; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite_label

		onClicked: {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 0
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

	}

}

	//Played games

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(63*screenRatio) : vpx(56*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		favorite_button;
	}

	KeyNavigation.right: {
		search_button;
	}

	KeyNavigation.down: {
		gameView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

	}

	Text {
		id: played_label
		text: "Played"
		color: currentCollectionIndex === 1 ? theme.accent : theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		font.bold: currentCollectionIndex === 1 ? true : false

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: favorite_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	MouseArea {
		id: played_mouse
		anchors.fill: played_label

		onClicked: {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

	}

}

	//Search games

	Rectangle {
		id: search_button
		width: aspectRatio === 43 ? vpx(65*screenRatio) : vpx(58*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus || header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus ? theme.select : theme.background
                border.color: focus || header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		played_button;
	}

	KeyNavigation.down: {
		gameView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = currentCollectionIndex + ''
			navigate('Software');
			header__search_layout.focus = true
			gameView.visible = false
			
		}

	}

	Text {
		id: search_label
		text: "Search"
		color: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus || searchValue ? theme.accent : theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		font.bold: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus || searchValue ? true : false

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: played_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	MouseArea {
		id: search_mouse
		anchors.fill: search_label

		onClicked: {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			header__search_input.text = 'Search'
			currentCollectionIndex = currentCollectionIndex + ''
			navigate('Software');
			header__search_layout.focus = true
			gameView.visible = false
		}

	}

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
			searchValue = ' '
			header__search_input.text = 'Search'
			search_button.focus = true
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
			searchValue = ' '
			header__search_input.text = 'Search'
			search_button.focus = true
			gameView.visible = false
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			searchValue = ' '
			header__search_input.text = 'Search'
			search_button.focus = true
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
			searchValue = ' '
			header__search_input.text = 'Search'
			search_button.focus = true
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
			gameView.model = searchGames
			gameView.currentIndex = 0
			navigate('Software');
			search_button.focus = true
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
			searchValue = ' '
			header__search_input.text = 'Search'
			search_button.focus = true
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
			gameView.model = searchGames
			gameView.currentIndex = 0
			navigate('Software');
			search_button.focus = true
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

	KeyNavigation.up: profile_button;

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
		property bool selected: gameView.focus && GridView.isCurrentItem
		width: gameView.cellWidth - vpx(12*screenRatio)
		height: width
		scale: selected ? 1.07 : 1
		visible: currentPage === 'Software' ? true : false

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
		}

		else if (game__settings_layout_favorite_button.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (personal__center_layout_icon.focus) {
			navigate('Software')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Software')
		}

		else if (selected) {
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
		}

		else if (game__settings_layout_favorite_button.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (personal__center_layout_icon.focus) {
			navigate('Software')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Software')
		}

		else if (selected) {
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
		opacity: selected ? 1 : 0

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
		sourceSize.width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(23*screenRatio)
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

	Rectangle {
		id: personal__center_layout_up
		width: aspectRatio === 43 ? vpx(240*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(230*screenRatio) : vpx(220*screenRatio)
		color: "#2C2C2C"
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		visible: personal__center_layout_up.focus || personal__center_layout_icon.focus || personal__center_layout_down_button.focus ? 1 : 0

	Text {
		id: personal__center_layout_label
		text: "Personal Center"
		color: "#FFFFFF"
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(16*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		horizontalCenter: parent.horizontalCenter
	}

}

	Rectangle {
		id: personal__center_layout_down
		width: aspectRatio === 43 ? vpx(240*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(135*screenRatio) : vpx(125*screenRatio)
		color: "#EBEBEB"
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		clip: true

	Rectangle {
		id: personal__center_layout_down_clipped
		width: parent.width 
		height: parent.height + radius
		color: "#EBEBEB"
                border.color: personal__center_layout_down.border.color
		border.width: personal__center_layout_down.border.width
		radius: personal__center_layout_down.radius

	anchors {
		bottom: parent.bottom;
	}

}

	anchors {
		bottom: parent.bottom;
	}

}

	Rectangle {
		id: personal__center_layout_icon
		width: aspectRatio === 43 ? vpx(80*screenRatio) : vpx(70*screenRatio)
		height: width
		color: "#FFFFFF"
                border.color: focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)

	Keys.onDownPressed: {
			personal__center_layout_down_button.focus = true
		}

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
			event.accepted = true
			profile_button.focus = true
		}

	}

	Image {
		id: personal__center_layout_icon_image
		sourceSize.width: aspectRatio === 43 ? vpx(70*screenRatio) : vpx(60*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.png"
		antialiasing: true
		smooth: true

	anchors {
		centerIn: personal__center_layout_icon
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(45*screenRatio) : vpx(50*screenRatio)
		horizontalCenter: parent.horizontalCenter;
	}

	Image {
		id: personal__center_layout_lace_image
		sourceSize.height: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/lace.png"
		antialiasing: true
		smooth: true

	anchors {
		top: personal__center_layout_icon.bottom; topMargin: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(6*screenRatio);
		horizontalCenter: parent.horizontalCenter;
	}

	Text {
		id: personal__center_layout_lace_label
		text: "Pegasus"
		color: "grey"
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)

	anchors {
		centerIn: parent
	}
}

}

}
	Rectangle {
		id: personal__center_layout_down_button
		width: aspectRatio === 43 ? vpx(105*screenRatio) : vpx(90*screenRatio)
		height: aspectRatio === 43 ? vpx(35*screenRatio) : vpx(30*screenRatio)
		color: focus ? "#A9A9A9" : "transparent"
                border.color: focus ? theme.accent : "transparent"
		border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	Keys.onUpPressed: {
			personal__center_layout_icon.focus = true
		}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			swapTheme();
			currentCollectionIndex = currentCollectionIndex + ''
			navigate('Software');
			gameView.visible = true
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			profile_button.focus = true
		}

	}

	MouseArea {
		id: personal__center_layout_down_button_mouse
		anchors.fill: personal__center_layout_down_button

		onClicked:{
			searchValue = ''
			header__search_input.text = 'Search'
			swapTheme();
			currentCollectionIndex = currentCollectionIndex + ''
			navigate('Software');
			gameView.visible = true
		}

	}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(22*screenRatio) : vpx(25*screenRatio)
	}

	Rectangle {
		id: personal__center_layout_down_switch
		width: aspectRatio === 43 ? vpx(53*screenRatio) : vpx(45*screenRatio)
		height: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		color: "#2C2C2C"
 		radius: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(30*screenRatio)

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		verticalCenter: parent.verticalCenter;
	}

	Rectangle {
		id: personal__center_layout_down_switch_light
		width: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(28*screenRatio)
		height: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		color: "#EBEBEB"
                border.color: "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(2*screenRatio)
		radius: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(30*screenRatio)
		visible: theme === themeLight ? true : false

	anchors {
		left: parent.left;
		verticalCenter: parent.verticalCenter;
	}

	Text {
		id: personal__center_layout_down_switch_light_label
		text: "Light"
		color: "#2C2C2C"
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(13*screenRatio)

	anchors {
		verticalCenter: parent.verticalCenter
		left: parent.right; leftMargin: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(24*screenRatio)
	}

	}

}

	Rectangle {
		id: personal__center_layout_down_switch_dark
		width: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(28*screenRatio)
		height: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		color: "#EBEBEB"
                border.color: "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(2*screenRatio)
		radius: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(30*screenRatio)
		visible: theme === themeDark ? true : false

	anchors {
		right: parent.right;
		verticalCenter: parent.verticalCenter;
	}

	Text {
		id: personal__center_layout_down_switch_dark_label
		text: "Dark"
		color: "#2C2C2C"
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(13*screenRatio)

	anchors {
		verticalCenter: parent.verticalCenter
		left: parent.right; leftMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(8*screenRatio)
	}

}

}

}

}

	anchors {
		top: header.bottom; topMargin: aspectRatio === 43 ? vpx(55*screenRatio) : vpx(20*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(210*screenRatio) : vpx(225*screenRatio);
	}

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
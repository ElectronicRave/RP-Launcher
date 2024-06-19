import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: software

	//Back to Home

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
			event.accepted = true

		if (searchValue) {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		else if (header__search_button_ok.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		else if (header__search_button_cancel.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		else {
			api.memory.unset('currentCollectionIndex', currentCollectionIndex)
			searchValue = ''
			navigate('Home')
		}

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

	//Personal center

	Rectangle {
		id: personal__center_layout_up
		width: aspectRatio === 43 ? vpx(230*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(95*screenRatio) : vpx(95*screenRatio)
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		clip: true
		visible: personal__center_layout_icon.focus || personal__center_layout_down_button.focus

	Rectangle {
		id: personal__center_layout_up_clipped
		width: parent.width
		height: parent.height + radius
		color: "#2C2C2C"
                border.color: personal__center_layout_up.border.color
		border.width: personal__center_layout_up.border.width
		radius: personal__center_layout_up.radius

	anchors {
		top: parent.top;
	}

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

	}

	anchors {
		top: parent.bottom; topMargin: aspectRatio === 43 ? vpx(55*screenRatio) : vpx(22*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(210*screenRatio) : vpx(220*screenRatio)
	}

}

	Rectangle {
		id: personal__center_layout_down
		width: aspectRatio === 43 ? vpx(230*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(125*screenRatio) : vpx(125*screenRatio)
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		clip: true
		visible: personal__center_layout_icon.focus || personal__center_layout_down_button.focus

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

	Rectangle {
		id: personal__center_layout_down_button
		width: aspectRatio === 43 ? vpx(105*screenRatio) : vpx(90*screenRatio)
		height: aspectRatio === 43 ? vpx(35*screenRatio) : vpx(30*screenRatio)
		color: focus ? theme.select : "transparent"
                border.color: focus ? theme.accent : "transparent"
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)

	KeyNavigation.up: personal__center_layout_icon

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			swapTheme();
			navigate('Software');
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			profile_icon.focus = true
		}

	}

	MouseArea {
		id: personal__center_layout_down_button_mouse
		anchors.fill: personal__center_layout_down_button
		onClicked:{
			swapTheme();
			navigate('Software');
		}

	}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		verticalCenter: parent.verticalCenter;
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
		visible: api.memory.get('theme')  == "themeLight" ? true : false

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
		visible: api.memory.get('theme')  == "themeDark" ? true : false

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

	}

	anchors {
		top: personal__center_layout_up.bottom;
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(210*screenRatio) : vpx(220*screenRatio);
	}

}

	Rectangle {
		id: personal__center_layout_icon
		width: aspectRatio === 43 ? vpx(80*screenRatio) : vpx(70*screenRatio)
		height: width
		color: "#EBEBEB"
                border.color: focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(3,5*screenRatio) : vpx(2.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)
		visible: personal__center_layout_icon.focus || personal__center_layout_down_button.focus

	Image {
		id: theme__color_layout_icon_image
		sourceSize.width: aspectRatio === 43 ? vpx(70*screenRatio) : vpx(60*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.svg"
		antialiasing: true
		smooth: true

	anchors {
		centerIn: personal__center_layout_icon
	}

}

	anchors {
		top: parent.bottom; topMargin: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(70*screenRatio)
		horizontalCenter: personal__center_layout_up.horizontalCenter;
	}

	KeyNavigation.down: personal__center_layout_down_button

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
			event.accepted = true
			profile_icon.focus = true
		}

	}

}

	//Profile icon

	Rectangle {
		id: profile_button
		width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(35*screenRatio)
		height: width
		color: "#EBEBEB"
                border.color: focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)

	Image {
		id: profile_icon
		sourceSize.width: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(30*screenRatio)
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
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
	}
              
	KeyNavigation.right: all_button;
	KeyNavigation.down: gameView;
              
	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			personal__center_layout_icon.focus = true
		}

	}

	MouseArea {
		id: profile_icon_mouse
		anchors.fill: profile_button
		onClicked:{
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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: profile_button.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(48*screenRatio)
	}

	KeyNavigation.left: profile_button;
	KeyNavigation.right: favorite_button;
	KeyNavigation.down: gameView;

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			currentCollectionIndex = 2
			navigate('Software')
		}

	}

	MouseArea {
		id: all_mouse
		anchors.fill: all_label
		onClicked: {
			searchValue = ''
			currentCollectionIndex = 2
			navigate('Software')
		}

	}

}

	//Favorite games

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(72*screenRatio) : vpx(65*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: all_button.right; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	KeyNavigation.left: all_button;
	KeyNavigation.right: played_button;
	KeyNavigation.down: gameView;

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			currentCollectionIndex = 0
			navigate('Software')
		}

	}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite_label
		onClicked: {
			searchValue = ''
			currentCollectionIndex = 0
			navigate('Software')
		}

	}

}

	//Played games

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(62*screenRatio) : vpx(53*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
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
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: favorite_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	KeyNavigation.left: favorite_button;
	KeyNavigation.right: search_button;
	KeyNavigation.down: gameView;

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			currentCollectionIndex = 1
			navigate('Software')
		}

	}

	MouseArea {
		id: played_mouse
		anchors.fill: played_label
		onClicked: {
			searchValue = ''
			currentCollectionIndex = 1
			navigate('Software')
		}

	}

}

	//Search content

	Rectangle {
		id: search_button
		width: aspectRatio === 43 ? vpx(64*screenRatio) : vpx(55*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: 1

	Text {
		id: search_label
		text: "Search"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(18*screenRatio)
		left: played_button.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

	KeyNavigation.left: played_button;
	KeyNavigation.down: gameView;

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

	}

	MouseArea {
		id: search_mouse
		anchors.fill: search_label
		onClicked: {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

	}

}

	Rectangle {
		id: header__search_layout
		color: theme.background
		width: aspectRatio === 43 ? vpx(270*screenRatio) : vpx(250*screenRatio)
		height: aspectRatio === 43 ? vpx(170*screenRatio) : vpx(150*screenRatio)
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: vpx(3*screenRatio)
		visible: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus

	anchors {
		top: header.bottom; topMargin: aspectRatio === 43 ? vpx(80*screenRatio) : vpx(55*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(185*screenRatio) : vpx(215*screenRatio)
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

	KeyNavigation.down: header__search_button_cancel;

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
			search_button.focus = true
		}

	}

}

	Rectangle {
		id: header__search_button_cancel
		width: aspectRatio === 43 ? vpx(52*screenRatio) : vpx(52*screenRatio)
		height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		visible: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus

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

	KeyNavigation.up: header__search_input;
	KeyNavigation.right: header__search_button_ok;

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

	        if (event.key === Qt.Key_Up) {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

	}

	MouseArea {
		id: header__search_button_cancel_mouse
		anchors.fill: header__search_button_cancel
		onClicked: {

		if (header__search_input.focus) {
			searchValue = ''
			header__search_input.text = 'Search'
			header__search_layout.focus = true
		}

		else {
			searchValue = ''
			header__search_input.text = 'Search'
			search_button.focus = true
		}

		}

	}

}

	Rectangle {
		id: header__search_button_ok
		width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		visible: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus

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
		left: header__search_button_cancel.right; leftMargin: aspectRatio === 43 ? vpx(6*screenRatio) : vpx(8*screenRatio)
	}

	KeyNavigation.up: header__search_input;
	KeyNavigation.left: header__search_button_cancel;

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (searchValue) {
			event.accepted = true
			currentCollectionIndex = 2
			gameView.currentIndex = 0
			gameView.model = searchGames
			navigate('Software')
		}

		else {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

		}

	        if (event.key === Qt.Key_Up) {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

	}

	MouseArea {
		id: header__search_button_ok_mouse
		anchors.fill: header__search_button_ok
		onClicked: {

		if (searchValue) {
			currentCollectionIndex = 2
			gameView.currentIndex = 0
			gameView.model = searchGames
			navigate('Software')
		}

		else {
			searchValue = ''
			header__search_input.clear()
			header__search_input.focus = true
		}

		}

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
		visible: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus

	anchors {
		centerIn: header__search_layout
	}


	Image {
		id: header__search_icon
		sourceSize.width: aspectRatio === 43 ? vpx(22*screenRatio) : vpx(20*screenRatio)
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
		color: searchValue ? theme.text : "grey"
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		clip: true

	anchors {
		left: header__search_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		right: header__search.right; rightMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio)
		verticalCenter: header__search.verticalCenter
	}

	onTextEdited: {
		searchValue = header__search_input.text
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

	        if (event.key === Qt.Key_Down) {

		if (searchValue) {
		}

		else {
			searchValue = ''
			header__search_input.text = 'Search'
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
		visible: header__search_layout.focus || header__search_input.focus || header__search_button_cancel.focus || header__search_button_ok.focus || personal__center_layout_up.focus || personal__center_layout_down.focus || personal__center_layout_icon.focus || personal__center_layout_down_button.focus ? 0 : 1

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

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
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
		width: gameView.cellWidth - vpx(12*screenRatio)
		height: width
		scale: selected ? 1.07 : 1

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

	MouseArea {
		id: game__item_mouse
		anchors.fill: game__item
		onPressAndHold: {
			currentGameIndex = index
			currentGame.favorite = !currentGame.favorite
		}
		onClicked: {
			if (selected) {
				currentGameIndex = index
				currentGame.launch()
			}
			else
				gameView.currentIndex = index
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
		opacity: selected ? 1 : 0
		radius: vpx(4*screenRatio)

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

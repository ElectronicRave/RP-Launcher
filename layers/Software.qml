import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: software

		property var searchFocus: search_layout.focus || search_input.focus || search_game_name_item_button.focus || search_file_name_item_button.focus || search_contain_item_button.focus || search_start_with_item_button.focus || search_button_cancel.focus || search_button_ok.focus

		property var personalFocus: personal__center_layout_icon.focus || personal__center_layout_down_button.focus

		property var settingsFocus: game__settings_layout.focus || game__settings_layout_favorite_button.focus

	//Back to Home

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
			event.accepted = true
			gameView.visible = true
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
			searchValue = ''
			search_input.clear()
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
                border.color: focus || personalFocus && none ? theme.accent : "#2C2C2C"
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
			event.accepted = true
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

		if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else if (searchFocus) {
			searchValue = ''
			search_input.text = 'Search'
			personal__center_layout_up.focus = true
		}

		else if (personalFocus) {
			navigate('Software')
		}

		else if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else {
			personal__center_layout_icon.focus = true
		}

		}

	}
              
}

	//All games

	Rectangle {
		id: all_button
		width: aspectRatio === 43 ? vpx(37*screenRatio) : vpx(31*screenRatio)
		height: aspectRatio === 43 ? vpx(36*screenRatio) : vpx(32*screenRatio)
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

		if (searchValue) {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		else if (currentCollectionIndex === 2) {
			null
		}

		else {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		}

	}

	Text {
		id: all_button_label
		property var anyFocus: currentCollectionIndex === 0 || currentCollectionIndex === 1 || searchFocus || search_input.text || searchValue
		height: anyFocus ? aspectRatio === 43 ? vpx(27.4*screenRatio) : vpx(23*screenRatio) : aspectRatio === 43 ? vpx(36*screenRatio) : vpx(30*screenRatio)
		text: "All"
		color: anyFocus ? theme.title : theme.accent
		font.family: anyFocus ? global.fonts.sans : titleFontBold.name
		font.pixelSize: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}
}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		left: profile_button.right; leftMargin: aspectRatio === 43 ? vpx(50*screenRatio) : vpx(50*screenRatio)
	}

	MouseArea {
		id: all_button_mouse
		anchors.fill: all_button

		onClicked: {

		if (searchValue) {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		else if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else if (personalFocus) {
			navigate('Software')
		}

		else if (currentCollectionIndex === 2 && gameView.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (currentCollectionIndex === 2) {
			personal__center_layout_up.focus = true
		}

		else if (searchFocus) {
			searchValue = ''
			search_input.text = 'Search'
			personal__center_layout_up.focus = true
		}

		else if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		}

	}

}

	//Favorite games

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(88*screenRatio) : vpx(72*screenRatio)
		height: aspectRatio === 43 ? vpx(36*screenRatio) : vpx(32*screenRatio)
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

		if (currentCollectionIndex === 0) {
			null
		}

		else {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 0
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		}

	}

	Text {
		id: favorite_button_label
		height: currentCollectionIndex === 0 ? aspectRatio === 43 ? vpx(36*screenRatio) : vpx(30*screenRatio) : aspectRatio === 43 ? vpx(27.4*screenRatio) : vpx(23*screenRatio)
		text: "Favorite"
		color: currentCollectionIndex === 0 ? theme.accent : theme.title
		font.family: currentCollectionIndex === 0 ? titleFontBold.name : global.fonts.sans
		font.pixelSize: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		left: all_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: favorite_button_mouse
		anchors.fill: favorite_button

		onClicked: {

		if (personalFocus) {
			navigate('Software')
		}

		else if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else if (currentCollectionIndex === 0 && gameView.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (currentCollectionIndex === 0) {
			personal__center_layout_up.focus = true
		}

		else if (searchFocus) {
			searchValue = ''
			search_input.text = 'Search'
			personal__center_layout_up.focus = true
		}

		else if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 0
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		}

	}

}

	//Played games

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(70*screenRatio) : vpx(57*screenRatio)
		height: aspectRatio === 43 ? vpx(36*screenRatio) : vpx(32*screenRatio)
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

		if (currentCollectionIndex === 1) {
			null
		}

		else {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		}

	}

	Text {
		id: played_button_label
		height: currentCollectionIndex === 1 ? aspectRatio === 43 ? vpx(36*screenRatio) : vpx(30*screenRatio) : aspectRatio === 43 ? vpx(27.4*screenRatio) : vpx(23*screenRatio)
		text: "Played"
		color: currentCollectionIndex === 1 ? theme.accent : theme.title
		font.family: currentCollectionIndex === 1 ? titleFontBold.name : global.fonts.sans
		font.pixelSize: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		left: favorite_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: played_button_mouse
		anchors.fill: played_button

		onClicked: {

		if (personalFocus) {
			navigate('Software')
		}

		else if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else if (currentCollectionIndex === 1 && gameView.focus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (currentCollectionIndex === 1) {
			personal__center_layout_up.focus = true
		}

		else if (searchFocus) {
			searchValue = ''
			search_input.text = 'Search'
			personal__center_layout_up.focus = true
		}

		else if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else {
			searchValue = ''
			search_input.clear()
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
			gameView.visible = true
		}

		}

	}

}

	//Search games

	Rectangle {
		id: search_button
		width: aspectRatio === 43 ? vpx(74*screenRatio) : vpx(60*screenRatio)
		height: aspectRatio === 43 ? vpx(36*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
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
			search_game_name_item.visible = false
			search_file_name_item.visible = true
			search_contain_item.visible = true
			search_start_with_item.visible = false
			searchValue = ''
			search_input.text = 'Search'
			currentCollectionIndex = ''
			search_layout.focus = true
			gameView.visible = false
		}

	}

	Text {
		id: search_button_label
		property var anyFocus: searchFocus || search_input.text || searchValue
		height: anyFocus ? aspectRatio === 43 ? vpx(36*screenRatio) : vpx(30*screenRatio) : aspectRatio === 43 ? vpx(27.4*screenRatio) : vpx(23*screenRatio)
		text: "Search"
		color: anyFocus ? theme.accent : theme.title
		font.family: anyFocus ? titleFontBold.name : global.fonts.sans
		font.pixelSize: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		left: played_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: search_button_mouse
		anchors.fill: search_button

		onClicked: {

		if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else if (searchFocus) {
			personal__center_layout_up.focus = true
		}

		else if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (personalFocus) {
			navigate('Software')
		}

		else {
			search_game_name_item.visible = false
			search_file_name_item.visible = true
			search_contain_item.visible = true
			search_start_with_item.visible = false
			searchValue = ''
			search_input.text = 'Search'
			currentCollectionIndex = ''
			search_layout.focus = true
			gameView.visible = false
		}

		}

	}

}

	//Wifi status

	Wifi {
		id: wifi
	}

	//Battery status

	Battery {
		id: battery
	}

}

	//Search component

	Rectangle {
		id: search_layout
		color: theme.background
		width: aspectRatio === 43 ? vpx(325*screenRatio) : vpx(265*screenRatio)
		height: aspectRatio === 43 ? vpx(240*screenRatio) : vpx(205*screenRatio)
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: vpx(3*screenRatio)
		visible: searchFocus ? 1 : 0

	Keys.onRightPressed: {
		search_file_name_item_button.focus = true
	}

	Keys.onDownPressed: {
		search_game_name_item_button.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			search_input.clear()
			search_input.focus = true
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			search_button.focus = true
		}

	}

	Rectangle {
		id: search
		color: "#EBEBEB"
		width: aspectRatio === 43 ? vpx(185*screenRatio) : vpx(145*screenRatio)
		height: aspectRatio === 43 ? vpx(35*screenRatio) : vpx(28*screenRatio)
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: vpx(5*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(20*screenRatio)
		horizontalCenter: parent.horizontalCenter
	}

	Image {
		id: search_icon
		sourceSize.width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(22*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/search.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: "#000000" }
		antialiasing: true
		smooth: true

	anchors {
		left: search.left; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		verticalCenter: search.verticalCenter
	}

}

	TextInput {
		id: search_input
		color: searchValue ? "#000000" : "grey"
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(12*screenRatio)
		clip: true

	Keys.onRightPressed: {
		if (searchValue) {
			search_file_name_item_button.focus = true
		}

		else if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_file_name_item_button.focus = true
		}

	}

	Keys.onDownPressed: {
		if (searchValue) {
			search_game_name_item_button.focus = true
		}

		else if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_game_name_item_button.focus = true
		}

	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (searchValue) {
			search_layout.focus = true
		}

		else {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		}

		if (api.keys.isCancel(event)) {
			event.accepted = true

		if (searchValue) {
			search_layout.focus = true
		}

		else {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

	}

}

	anchors {
		left: search_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		right: search.right; rightMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio)
		verticalCenter: search.verticalCenter
	}

	onTextEdited: {
		searchValue = search_input.text
	}

}

	MouseArea {
		id: search_input_mouse
		anchors.fill: search_input

		onClicked: {
			searchValue = ''
			search_input.clear()
			search_input.focus = true
		}

	}

}

	Text {
		id: search_object_label
		color: theme.text
		text: "Search Object"
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		top: search.bottom; topMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

}

	Rectangle {
		id: search_game_name_item_button
		width: aspectRatio === 43 ? vpx(108*screenRatio) : vpx(90*screenRatio)
		height: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		color: "transparent"
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)

	Keys.onUpPressed: {
		searchValue = ''
		search_input.clear()
		search_input.focus = true
	}

	Keys.onRightPressed: {
		search_file_name_item_button.focus = true
	}

	Keys.onDownPressed: {
		search_contain_item_button.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			search_game_name_item.visible = true
			search_file_name_item.visible = false
		}

	}

	Rectangle {
		id: search_game_name_item_border
		width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_game_name_item
		width: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio)
		height: width
		color: theme.accent
		radius: 100
		visible: false

	anchors {
		centerIn: search_game_name_item_border
	}

}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Text {
		id: search_game_name_item_label
		color: theme.title
		text: "Game name"
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(11*screenRatio)

	anchors {
		left: search_game_name_item_border.right; leftMargin: aspectRatio === 43 ? vpx(7*screenRatio) : vpx(7*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	anchors {
		top: search_object_label.bottom; topMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	MouseArea {
		id: search_game_name_item_button_mouse
		anchors.fill: search_game_name_item_button

		onClicked:{
			search_game_name_item.visible = true
			search_file_name_item.visible = false
		}

	}

}

	Rectangle {
		id: search_file_name_item_button
		width: aspectRatio === 43 ? vpx(93*screenRatio) : vpx(78*screenRatio)
		height: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		color: "transparent"
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)

	Keys.onUpPressed: {
		searchValue = ''
		search_input.clear()
		search_input.focus = true
	}

	Keys.onLeftPressed: {
		search_game_name_item_button.focus = true
	}

	Keys.onRightPressed: {
		search_button_cancel.focus = true
	}

	Keys.onDownPressed: {
		search_start_with_item_button.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			search_game_name_item.visible = false
			search_file_name_item.visible = true
		}

	}

	Rectangle {
		id: search_file_name_item_border
		width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_file_name_item
		width: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio)
		height: width
		color: theme.accent
		radius: 100

	anchors {
		centerIn: search_file_name_item_border
	}

}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Text {
		id: search_file_name_item_label
		color: theme.title
		text: "File name"
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(11*screenRatio)

	anchors {
		left: search_file_name_item_border.right; leftMargin: aspectRatio === 43 ? vpx(7*screenRatio) : vpx(7*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	anchors {
		top: search_object_label.bottom; topMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio);
		left: search_game_name_item_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: search_filee_name_item_button_mouse
		anchors.fill: search_file_name_item_button

		onClicked:{
			search_game_name_item.visible = false
			search_file_name_item.visible = true
		}

	}

}

	Text {
		id: search_method_label
		color: theme.text
		text: "Search Method"
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		top: search_file_name_item_button.bottom; topMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

}

	Rectangle {
		id: search_contain_item_button
		width: aspectRatio === 43 ? vpx(93*screenRatio) : vpx(78*screenRatio)
		height: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		color: "transparent"
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)

	Keys.onUpPressed: {
		search_game_name_item_button.focus = true
	}

	Keys.onLeftPressed: {
		null
	}

	Keys.onRightPressed: {
		search_start_with_item_button.focus = true
	}

	Keys.onDownPressed: {
		search_button_cancel.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			search_contain_item.visible = true
			search_start_with_item.visible = false
		}

	}

	Rectangle {
		id: search_contain_item_border
		width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_contain_item
		width: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio)
		height: width
		color: theme.accent
		radius: 100

	anchors {
		centerIn: search_contain_item_border
	}

}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Text {
		id: search_contain_item_label
		color: theme.title
		text: "Contain..."
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(11*screenRatio)

	anchors {
		left: search_contain_item_border.right; leftMargin: aspectRatio === 43 ? vpx(7*screenRatio) : vpx(7*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	anchors {
		top: search_method_label.bottom; topMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}

	MouseArea {
		id: search_contain_item_button_mouse
		anchors.fill: search_contain_item_button

		onClicked:{
			search_contain_item.visible = true
			search_start_with_item.visible = false
		}

	}

}

	Rectangle {
		id: search_start_with_item_button
		width: aspectRatio === 43 ? vpx(104*screenRatio) : vpx(87*screenRatio)
		height: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(22*screenRatio)
		color: "transparent"
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)

	Keys.onUpPressed: {
		search_file_name_item_button.focus = true
	}

	Keys.onLeftPressed: {
		search_contain_item_button.focus = true
	}

	Keys.onRightPressed: {
		search_button_cancel.focus = true
	}

	Keys.onDownPressed: {
		search_button_cancel.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			search_contain_item.visible = false
			search_start_with_item.visible = true
		}

	}

	Rectangle {
		id: search_start_with_item_border
		width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_start_with_item
		width: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(8*screenRatio)
		height: width
		color: theme.accent
		radius: 100
		visible: false

	anchors {
		centerIn: search_start_with_item_border
	}

}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	Text {
		id: search_start_with_item_label
		color: theme.title
		text: "Start with..."
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(11*screenRatio)

	anchors {
		left: search_start_with_item_border.right; leftMargin: aspectRatio === 43 ? vpx(7*screenRatio) : vpx(7*screenRatio)
		verticalCenter: parent.verticalCenter
	}

}

	anchors {
		top: search_method_label.bottom; topMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio);
		left: search_contain_item_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: search_start_with_item_button_mouse
		anchors.fill: search_start_with_item_button

		onClicked:{
			search_contain_item.visible = false
			search_start_with_item.visible = true
		}

	}

}

	Rectangle {
		id: search_button_cancel
		width: aspectRatio === 43 ? vpx(60*screenRatio) : vpx(50*screenRatio)
		height: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(25*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	Keys.onUpPressed: {
		search_start_with_item_button.focus = true
	}

	Keys.onLeftPressed: {
		search_start_with_item_button.focus = true
	}

	Keys.onRightPressed: {
		search_button_ok.focus = true
	}

	Keys.onDownPressed: {
		null
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ' '
			search_button.focus = true
		}

	}

	Text {
		id: search_button_cancel_label
		text: "Cancel"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(15*screenRatio)
		font.bold: true

	anchors {
		centerIn: parent
	}

}

	anchors {
		right: search_layout.right; rightMargin: aspectRatio === 43 ? vpx(55*screenRatio) : vpx(50*screenRatio)
		bottom: search_layout.bottom; bottomMargin: aspectRatio === 43 ? vpx(13*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: search_button_cancel_mouse
		anchors.fill: search_button_cancel

		onClicked: {

		if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else {
			searchValue = ' '
			personal__center_layout_up.focus = true
		}

		}

	}

}

	Rectangle {
		id: search_button_ok
		width: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(25*screenRatio)
		height: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(25*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	Keys.onUpPressed: {
		search_start_with_item_button.focus = true
	}

	Keys.onLeftPressed: {
		search_button_cancel.focus = true
	}

	Keys.onRightPressed: {
		null
	}

	Keys.onDownPressed: {
		null
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (searchValue) {
			event.accepted = true
			gameView.model = searchGames
			gameView.currentIndex = 0
			currentCollectionIndex = 2
			navigate('Software');
			search_button.focus = true
			gameView.visible = true
		}

		else {
			searchValue = ' '
			search_button.focus = true
		}

		}

	}

	Text {
		id: search_button_ok_label
		text: "OK"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		centerIn: parent
	}

}

	anchors {
		left: search_button_cancel.right; leftMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(8*screenRatio)
		bottom: search_layout.bottom; bottomMargin: aspectRatio === 43 ? vpx(13*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: search_button_ok_mouse
		anchors.fill: search_button_ok

		onClicked: {

		if (searchValue) {
			gameView.model = searchGames
			gameView.currentIndex = 0
			currentCollectionIndex = 2
			navigate('Software');
			gameView.visible = true
			personal__center_layout_up.focus = true
		}

		else if (search_input.focus) {
			searchValue = ''
			search_input.text = 'Search'
			search_layout.focus = true
		}

		else {
			searchValue = ' '
			personal__center_layout_up.focus = true
		}

		}

	}

}

	SequentialAnimation {
		id: search_layout_animation
		running: search_layout.visible

  	NumberAnimation {
		target: search_layout;
		property: "x";
		from: aspectRatio === 43 ? vpx(160*screenRatio) : vpx(210*screenRatio);
		to: aspectRatio === 43 ? vpx(160*screenRatio) : vpx(210*screenRatio);
		duration: 0;
	}

  	NumberAnimation {
		target: search_layout;
		property: "y";
		from: aspectRatio === 43 ? vpx(500*screenRatio) : vpx(450*screenRatio);
		to: aspectRatio === 43 ? vpx(120*screenRatio) : vpx(90*screenRatio);
		duration: 400;
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
		scale: selected || personalFocus && none ? 1.07 : 1
		visible: currentPage === 'Software' ? true : false

	OpacityAnimator {
		target: game__item_container;
		from: -1;
		to: 1;
		duration: 150
		running: game__item_container.visible ? 1 : 0
	}

	OpacityAnimator {
		target: game__item_container;
		from: 1;
		to: -1;
		duration: 0
		running: game__item_container.visible ? 0 : 1
	}

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

	Rectangle {
		id: game__id
		width: parent.width
		height: parent.height
		color: '#' + Math.random().toString(12).substring(2,8);
		radius: 100
		visible: modelData.assets.boxFront || modelData.assets.logo || modelData.assets.screenshots[0] ? 0 : 1

	Text {
		id: game__id_label
		text: modelData.title.substring(1,0)
		color: "#FFFFFF"
		font.pixelSize: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(26*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		fill: game__item
		margins: aspectRatio === 43 ? vpx(27*screenRatio) : vpx(19*screenRatio)
	}

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

		if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (personalFocus) {
			navigate('Software')
		}

		else if (selected) {
			currentGameIndex = index
			game__settings_layout.focus = true
		}

		else {
			gameView.currentIndex = index
			currentGameIndex = index
			navigate('Software');
			game__settings_layout.focus = true
		}

		}

		onClicked: {

		if (settingsFocus) {
			game__settings_layout.focus = false
			game__settings_layout_favorite_button.focus = false
		}

		else if (personalFocus) {
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
		visible: selected || personalFocus && none ? game__title_name.truncated : 0

	SequentialAnimation on x {
		running: selected || personalFocus && none ? game__title_name.truncated : 0
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
		opacity: selected || personalFocus && none ? 1 : 0

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
		width: aspectRatio === 43 ? vpx(290*screenRatio) : vpx(260*screenRatio)
		height: aspectRatio === 43 ? vpx(150*screenRatio) : vpx(120*screenRatio)
		color: theme.background
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		visible: settingsFocus ? 1 : 0

	OpacityAnimator {
		target: game__settings_layout;
		from: 0;
		to: 1;
		duration: 100
		running: game__settings_layout.visible ? 1 : 0
	}

	OpacityAnimator {
		target: game__settings_layout;
		from: 1;
		to: 0;
		duration: 0
		running: game__settings_layout.visible ? 0 : 1
	}

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
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(16*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(10*screenRatio)
		horizontalCenter: parent.horizontalCenter
	}

}

	Rectangle {
		id: game__settings_layout_line
		width: game__settings_layout.width
		height: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		color: theme.text
 
	anchors {
		top: game__settings_layout_label.bottom; topMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(10*screenRatio)
		horizontalCenter: game__settings_layout.horizontalCenter
	}

}

	Rectangle {
		id: game__settings_layout_favorite_button
		width: aspectRatio === 43 ? vpx(286*screenRatio) : vpx(256*screenRatio)
		height: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(35*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : "transparent"
		border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)
		visible: game__settings_layout.focus || game__settings_layout_favorite_button.focus ? 1 : 0

	Image {
		id: game__settings_layout_favorite_image
		sourceSize.width: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(23*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/favorite_menu.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.text }
		smooth: true

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio);
		verticalCenter: parent.verticalCenter;
	}

}

	Text {
		id: game__settings_layout_favorite_set_label
		text: "Set Favorite"
		color: theme.title
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(14*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(14*screenRatio)
		visible: currentGame.favorite ? 1 : 0

	anchors {
		left: game__settings_layout_favorite_image.right; leftMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio);
		verticalCenter: parent.verticalCenter
	}
}
	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(2*screenRatio);
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(24*screenRatio);
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

	//Personal center

	Rectangle {
		id: personal__center_layout_up
		width: aspectRatio === 43 ? vpx(300*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(290*screenRatio) : vpx(220*screenRatio)
		color: "#2C2C2C"
                border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio)
		visible: personalFocus ? 1 : 0

	OpacityAnimator {
		target: personal__center_layout_up;
		from: 0;
		to: 1;
		duration: 200
		running: personal__center_layout_up.visible ? 1 : 0
	}

	OpacityAnimator {
		target: personal__center_layout_up;
		from: 1;
		to: 0;
		duration: 0
		running: personal__center_layout_up.visible ? 0 : 1
	}

	Keys.onUpPressed: {
		profile_button.focus = true
	}

	Keys.onLeftPressed: {
		profile_button.focus = true
	}

	Keys.onRightPressed: {
		profile_button.focus = true
	}

	Keys.onDownPressed: {
		profile_button.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			profile_button.focus = true
		}

	}

	Text {
		id: personal__center_layout_label
		text: "Personal Center"
		color: "#FFFFFF"
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(16*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(10*screenRatio)
		horizontalCenter: parent.horizontalCenter
	}

}

	Rectangle {
		id: personal__center_layout_down
		width: aspectRatio === 43 ? vpx(300*screenRatio) : vpx(230*screenRatio)
		height: aspectRatio === 43 ? vpx(165*screenRatio) : vpx(125*screenRatio)
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
		width: aspectRatio === 43 ? vpx(95*screenRatio) : vpx(70*screenRatio)
		height: width
		color: "#FFFFFF"
                border.color: focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)

	Keys.onUpPressed: {
		null
	}

	Keys.onLeftPressed: {
		null
	}

	Keys.onRightPressed: {
		null
	}

	Keys.onDownPressed: {
		personal__center_layout_down_button.focus = true
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			null
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			navigate('Software')
		}

	}

	Image {
		id: personal__center_layout_icon_image
		sourceSize.width: aspectRatio === 43 ? vpx(85*screenRatio) : vpx(60*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.png"
		antialiasing: true
		smooth: true

	anchors {
		centerIn: personal__center_layout_icon
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(65*screenRatio) : vpx(50*screenRatio)
		horizontalCenter: parent.horizontalCenter;
	}

	Image {
		id: personal__center_layout_lace_image
		sourceSize.height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(20*screenRatio)
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

	Keys.onLeftPressed: {
		null
	}

	Keys.onRightPressed: {
		null
	}

	Keys.onDownPressed: {
		null
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			searchValue = ''
			search_input.clear()
			swapTheme();
			currentCollectionIndex = ''
			navigate('Software');
			gameView.visible = true
		}

		if (api.keys.isCancel(event)) {
			event.accepted = true
			navigate('Software')
		}

	}

	MouseArea {
		id: personal__center_layout_down_button_mouse
		anchors.fill: personal__center_layout_down_button

		onClicked:{
			searchValue = ''
			search_input.clear()
			swapTheme();
			currentCollectionIndex = ''
			navigate('Software');
			gameView.visible = true
		}

	}

	anchors {
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		bottom: parent.bottom; bottomMargin: aspectRatio === 43 ? vpx(35*screenRatio) : vpx(25*screenRatio)
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
		centerIn: parent
	}

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
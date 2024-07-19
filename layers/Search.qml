import QtQuick 2.15
import QtGraphicalEffects 1.12

	Rectangle {
		id: search_layout
		color: theme.background
		width: aspectRatio === 43 ? vpx(285*screenRatio) : vpx(265*screenRatio)
		height: aspectRatio === 43 ? vpx(210*screenRatio) : vpx(205*screenRatio)
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
		width: aspectRatio === 43 ? vpx(155*screenRatio) : vpx(145*screenRatio)
		height: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(28*screenRatio)
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1*screenRatio)
		radius: vpx(5*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
		horizontalCenter: parent.horizontalCenter
	}

	Image {
		id: search_icon
		sourceSize.width: aspectRatio === 43 ? vpx(22*screenRatio) : vpx(22*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(12*screenRatio)
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
		color: theme.title
		text: "Search Object"
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		top: search.bottom; topMargin: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(18*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

}

	Rectangle {
		id: search_game_name_item_button
		width: aspectRatio === 43 ? vpx(95*screenRatio) : vpx(90*screenRatio)
		height: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(22*screenRatio)
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
		width: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_game_name_item
		width: aspectRatio === 43 ? vpx(9*screenRatio) : vpx(8*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(11*screenRatio)

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
		width: aspectRatio === 43 ? vpx(82*screenRatio) : vpx(78*screenRatio)
		height: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(22*screenRatio)
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
		width: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_file_name_item
		width: aspectRatio === 43 ? vpx(9*screenRatio) : vpx(8*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(11*screenRatio)

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
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		top: search_file_name_item_button.bottom; topMargin: aspectRatio === 43 ? vpx(5*screenRatio) : vpx(5*screenRatio);
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

}

	Rectangle {
		id: search_contain_item_button
		width: aspectRatio === 43 ? vpx(82*screenRatio) : vpx(78*screenRatio)
		height: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(22*screenRatio)
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
		width: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_contain_item
		width: aspectRatio === 43 ? vpx(9*screenRatio) : vpx(8*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(11*screenRatio)

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
		width: aspectRatio === 43 ? vpx(92*screenRatio) : vpx(87*screenRatio)
		height: aspectRatio === 43 ? vpx(23*screenRatio) : vpx(22*screenRatio)
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
		width: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		height: width
		color: "transparent"
                border.color: theme.accent
                border.width: aspectRatio === 43 ? vpx(1.5*screenRatio) : vpx(1.5*screenRatio)
		radius: 100
		
	Rectangle {
		id: search_start_with_item
		width: aspectRatio === 43 ? vpx(9*screenRatio) : vpx(8*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(11*screenRatio)

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
		width: aspectRatio === 43 ? vpx(50*screenRatio) : vpx(50*screenRatio)
		height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
		font.bold: true

	anchors {
		centerIn: parent
	}

}

	anchors {
		right: search_layout.right; rightMargin: aspectRatio === 43 ? vpx(50*screenRatio) : vpx(50*screenRatio)
		bottom: search_layout.bottom; bottomMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: search_button_cancel_mouse
		anchors.fill: search_button_cancel

		onClicked: {
			searchValue = ' '
			profile_icon.focus = true
		}

	}

}

	Rectangle {
		id: search_button_ok
		width: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
		height: aspectRatio === 43 ? vpx(25*screenRatio) : vpx(25*screenRatio)
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
		font.pixelSize: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(14*screenRatio)
		font.bold: true

	anchors {
		centerIn: parent
	}

}

	anchors {
		left: search_button_cancel.right; leftMargin: aspectRatio === 43 ? vpx(8*screenRatio) : vpx(8*screenRatio)
		bottom: search_layout.bottom; bottomMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(10*screenRatio)
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
		}

		else {
			searchValue = ' '
			profile_icon.focus = true
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
		from: aspectRatio === 43 ? vpx(180*screenRatio) : vpx(210*screenRatio);
		to: aspectRatio === 43 ? vpx(180*screenRatio) : vpx(210*screenRatio);
		duration: 0;
	}

  	NumberAnimation {
		target: search_layout;
		property: "y";
		from: aspectRatio === 43 ? vpx(500*screenRatio) : vpx(450*screenRatio);
		to: aspectRatio === 43 ? vpx(135*screenRatio) : vpx(90*screenRatio);
		duration: 400;
	}

	}

}

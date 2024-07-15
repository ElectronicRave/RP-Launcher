import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: home

		property var personalFocus: personal__center_layout_up.focus || personal__center_layout_icon.focus || personal__center_layout_down_button.focus

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
                border.color: focus || personalFocus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)

	KeyNavigation.right: {
		all_button;
	}

	KeyNavigation.down: {
		systemListView;
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

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
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
		width: aspectRatio === 43 ? vpx(33*screenRatio) : vpx(31*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		profile_button;
	}

	KeyNavigation.right: {
		favorite_button;
	}

	KeyNavigation.down: {
		systemListView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			all_button.focus;
		}

	}

	Text {
		id: all_label
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(30*screenRatio)
		text: "All"
		color: theme.accent
		font.family: font.bold ? titleFontBold.name : 0
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(21*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}
}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: profile_button.right; leftMargin: aspectRatio === 43 ? vpx(50*screenRatio) : vpx(50*screenRatio)
	}

	MouseArea {
		id: all_mouse
		anchors.fill: all_label

		onClicked: {

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
		}

		else {
			all_button.focus;
		}

		}

	}

}

	//Favorite games

	Rectangle {
		id: favorite_button
		width: aspectRatio === 43 ? vpx(79*screenRatio) : vpx(72*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		all_button;
	}

	KeyNavigation.right: {
		played_button;
	}

	KeyNavigation.down: {
		systemListView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			currentCollectionIndex = 0
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
		}

	}

	Text {
		id: favorite_label
		text: "Favorite"
		color: theme.title
		font.pixelSize: aspectRatio === 43 ? vpx(21*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: all_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite_label

		onClicked: {

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
		}

		else {
			currentCollectionIndex = 0
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
		}

		}

	}

}

	//Played games

	Rectangle {
		id: played_button
		width: aspectRatio === 43 ? vpx(64*screenRatio) : vpx(57*screenRatio)
		height: aspectRatio === 43 ? vpx(34*screenRatio) : vpx(32*screenRatio)
		color: focus ? theme.select : theme.background
                border.color: focus ? theme.accent : theme.background
                border.width: aspectRatio === 43 ? vpx(1*screenRatio) : vpx(0.5*screenRatio)

	KeyNavigation.left: {
		favorite_button;
	}

	KeyNavigation.down: {
		systemListView;
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
		}

	}

	Text {
		id: played_label
		text: "Played"
		color: theme.title
		font.pixelSize: aspectRatio === 43 ? vpx(21*screenRatio) : vpx(19*screenRatio)

	anchors {
		centerIn: parent
	}

}

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(26*screenRatio) : vpx(20*screenRatio)
		left: favorite_button.right; leftMargin: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
	}

	MouseArea {
		id: played_mouse
		anchors.fill: played_label

		onClicked: {

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
		}

		else {
			currentCollectionIndex = 1
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
		}

		}

	}

}

	//Battery status

	Battery {
		id: battery
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
		id: system
		width: parent.width
		height: parent.height
		color: "transparent"
		clip: true

	ListView {
		id: systemListView
		model: allCollectionsHome
		snapMode: ListView.SnapOneItem
		delegate: systemDelegate
		orientation: ListView.Horizontal
		spacing: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)
		focus: currentPage === 'Home' ? true : false
		

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: aspectRatio === 43 ? vpx(135*screenRatio) : vpx(95*screenRatio)
		preferredHighlightEnd: aspectRatio === 43 ? vpx(510*screenRatio) : vpx(590*screenRatio)
		highlightMoveDuration: 200
		highlightMoveVelocity: -1

	KeyNavigation.up: favorite_button;

	KeyNavigation.down: quit;

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(58*screenRatio) : vpx(48*screenRatio)
		left: parent.left
		right: parent.right
		bottom: parent.bottom
	}

	Component {
		id: systemDelegate
                  
	Item {
		id: system__item_container
		property bool selected: systemListView.focus && ListView.isCurrentItem
		width: aspectRatio === 43 ? vpx(175*screenRatio) : vpx(122*screenRatio)
		height: width
		visible: currentPage === 'Home' ? true : false

	//Browse the collection and return to the same place after playing

	//Selecting the collection

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			currentCollectionIndex = system__item_container.ListView.view.currentIndex + 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
		}

	}

	Text {
		id: system__item_title
		height: aspectRatio === 43 ? vpx(38*screenRatio) : vpx(24*screenRatio)
		text: modelData.name
		color: theme.accent
		font.pixelSize: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(17*screenRatio)
		font.bold: true
		opacity: selected ? 1 : 0

	anchors {
		horizontalCenter: system__item_container.horizontalCenter
	}

}

	Rectangle {
		id: system__item
		width: parent.width
		height: parent.height
		color: theme.background

	anchors {
		top : system__item_title.bottom
	}
  


	Image {
		id: system__logo
		height: parent.height
		width: parent.width
		fillMode: Image.PreserveAspect
		source: "../assets/images/logos/"+modelData.shortName+".jpg"
		asynchronous: true
		visible: false
}

	OpacityMask {
		source: system__logo
		maskSource:

	Rectangle {
		width: system__logo.width
		height: system__logo.height
		radius: vpx(4*screenRatio)
		visible: true
	}

	anchors {
		fill: system__logo
	}

}

	MouseArea {
		id: system__logo_mouse
		anchors.fill: system__logo

		onPressAndHold: {

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
		}

		else if (selected) {
			system__item_container.scale = 1.07
		}

		else {
			systemListView.currentIndex = index
			system__item_container.scale = 1.07
		}

	}

		onReleased: {
			system__item_container.scale = 1
		}

		onClicked: {

		if (personal__center_layout_icon.focus) {
			navigate('Home')
		}

		else if (personal__center_layout_down_button.focus) {
			navigate('Home')
		}

		else if (selected) {
			currentCollectionIndex = system__item_container.ListView.view.currentIndex + 2
			api.memory.set('currentCollectionIndex', currentCollectionIndex);
			navigate('Software');
		}

		else {
			systemListView.currentIndex = index
			navigate('Home')
		}

		}

	}

	Rectangle {
		id: system__item_highlight
		width: parent.width
		height: parent.height
		color: "transparent"
		border.color: theme.accent
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
		radius: vpx(4*screenRatio)
		opacity: selected ? 1 : 0

	anchors {
		centerIn: system__logo
	}

}

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
		visible: personalFocus ? 1 : 0

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
			swapTheme();
			navigate('Home');
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
			swapTheme();
			navigate('Home');
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
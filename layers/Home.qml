import QtQuick 2.15
import QtGraphicalEffects 1.12

	Item {
		id: home

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
			api.memory.unset('currentCollectionIndex', currentCollectionIndex);
			navigate('Home');
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
			api.memory.unset('currentCollectionIndex', currentCollectionIndex);
			navigate('Home');
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
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
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
	KeyNavigation.down: systemListView;
              
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
	KeyNavigation.down: systemListView;

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
	KeyNavigation.down: systemListView;

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
	KeyNavigation.down: systemListView;

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
		visible: personal__center_layout_icon.focus || personal__center_layout_down_button.focus ? 0 : 1

	ListView {
		id: systemListView
		model: api.collections
		snapMode: ListView.SnapOneItem
		delegate: systemDelegate
		orientation: ListView.Horizontal
		focus: currentPage === 'Home' ? true : false
		spacing: aspectRatio === 43 ? vpx(10*screenRatio) : vpx(10*screenRatio)

		highlightRangeMode: ListView.StrictlyEnforceRange
		preferredHighlightBegin: aspectRatio === 43 ? vpx(135*screenRatio) : vpx(95*screenRatio)
		preferredHighlightEnd: aspectRatio === 43 ? vpx(510*screenRatio) : vpx(590*screenRatio)
		highlightMoveDuration: 200
		highlightMoveVelocity: -1

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(58*screenRatio) : vpx(48*screenRatio)
		left: parent.left
		right: parent.right
		bottom: parent.bottom
	}

	KeyNavigation.up: favorite_button;
	KeyNavigation.down: time_button

	Component {
		id: systemDelegate
                  
	Item {
		id: system__item_container
		property bool selected: ListView.isCurrentItem
		width: aspectRatio === 43 ? vpx(175*screenRatio) : vpx(122*screenRatio)
		height: width

	//Browse the collection and return to the same place after playing

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true
			currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
			api.memory.set('currentCollectionIndex', currentCollectionIndex)
			navigate('Software')
			return;
		}

	}

	Text {
		id: system__item_title
		text: modelData.name
		color: theme.accent
		font.pixelSize: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(17*screenRatio)
		font.bold: true
		height: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(28*screenRatio)
		verticalAlignment: Text.AlignVCenter
		elide: Text.ElideRight
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
		smooth: true
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
		onClicked: {
		if (selected) {
			currentCollectionIndex = system__item_container.ListView.view.currentIndex+3
			api.memory.set('currentCollectionIndex', currentCollectionIndex)
			navigate('Software')
			return;
		}
		else
			systemListView.currentIndex = index
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
	Header {}

	Footer {}

}
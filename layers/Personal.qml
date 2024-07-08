import QtQuick 2.15

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
		color: "#EBEBEB"
                border.color: focus ? theme.accent : "#2C2C2C"
		border.width: aspectRatio === 43 ? vpx(3.5*screenRatio) : vpx(2.5*screenRatio)
		radius: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(100*screenRatio)
		focus: personal__center_layout_up.focus

	Keys.onDownPressed: {
		if (currentPage === 'Home') {
			personal__center_layout_down_button.focus = true
		}

		else if (currentPage === 'Software') {
			personal__center_layout_down_button.focus = true
		}

	}

	Keys.onPressed: {
		if (api.keys.isCancel(event)) {
			event.accepted = true

		if (currentPage === 'Home') {
			profile_button.focus = true
		}

		else if (currentPage === 'Software') {
			profile_button.focus = true
		}

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

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
			event.accepted = true

		if (currentPage === 'Home') {
			swapTheme();
			navigate('Home');
		}

		else if (currentPage === 'Software') {
			swapTheme();
			navigate('Software');
		}

		}

		if (api.keys.isCancel(event)) {
			event.accepted = true

		if (currentPage === 'Home') {
			profile_button.focus = true
		}

		else if (currentPage === 'Software') {
			profile_button.focus = true
		}

		}

	}

	MouseArea {
		id: personal__center_layout_down_button_mouse
		anchors.fill: personal__center_layout_down_button

		onClicked:{

		if (currentPage === 'Home') {
			swapTheme();
			navigate('Home');
		}

		else if (currentPage === 'Software') {
			swapTheme();
			navigate('Software');
		}

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
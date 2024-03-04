import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: header
		property bool chargingStatus: api.device.batteryCharging
		color: headerCSS.background
		width: headerCSS.width
		height: headerCSS.height

	anchors {
		 top: parent.top
	}

	//Battery status

	Rectangle {
		id: header__battery
		property var chargingPercent: api.device.batteryPercent*100
		width: aspectRatio === 43 ? vpx(65*screenRatio) : vpx(65*screenRatio)
		height: parent
		color: "transparent"
		visible: headerHeightCorrection === 0 ? 1 : 0

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(18*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(-9*screenRatio) : vpx(-9*screenRatio)
	}

	Image {
		id: header__battery_icon
		sourceSize.width: aspectRatio === 43 ? vpx(42.5*screenRatio) : vpx(32.5*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: getBatteryIcon()
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(3*screenRatio) : vpx(3*screenRatio)
		right: header__battery_level.left; rightMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
	}

	//Battery levels

	property var level

	function getBatteryIcon() {
			if (level >= 0 && level <= 21)
			return "../assets/icons/battery_empty.svg"
		else
			if (level >= 21 && level <= 41)
			return "../assets/icons/battery_quarter.svg"
		else
			if (level >= 41 && level <= 61)
			return "../assets/icons/battery_half.svg"
		else
			if (level >= 61 && level <= 81)
			return "../assets/icons/battery_three_quarters.svg"
		else
			if (level >= 81 && level <= 100)
			return "../assets/icons/battery_full.svg"
		else
			return "../assets/icons/battery_empty.svg"
	}

	function set() {
		header__battery_icon.level = header__battery.chargingPercent
	}

	Timer {
		interval: 10000 //Run the timer every 10 seconds
		repeat: true
		running: true
		triggeredOnStart: true
		onTriggered: header__battery_icon.set()
	}

}

	Text {
		id: header__battery_level
		text: Math.floor(api.device.batteryPercent*100)+"%"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(14*screenRatio)
		font.bold: true

		anchors {
			top: parent.top; topMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(2*screenRatio)
		}

}

		Image {
			id: header__battery_icon_charging
			sourceSize.width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(13*screenRatio)
			fillMode: Image.PreserveAspectFit
			source: "../assets/icons/charge.svg"
			antialiasing: true
			smooth: true
			visible: chargingStatus && header__battery_icon.level < 100
                   
		anchors {
			top: parent.top; topMargin: aspectRatio === 43 ? vpx(7*screenRatio) : vpx(6*screenRatio)
			right: header__battery_icon.right; rightMargin: aspectRatio === 43 ? vpx(14*screenRatio) : vpx(12*screenRatio)
		}

}

}

	//Profile icon

	Image {
		id: profileIcon
		sourceSize.width: aspectRatio === 43 ? vpx(48*screenRatio) : vpx(36*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.svg"
		antialiasing: true
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(16*screenRatio)
		left: parent.left; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

}

	MouseArea {
		id: profileIcon_mouse
		anchors.fill: profileIcon
		onPressAndHold:{
			swapTheme()
			return;
	}

}

	//All games

	Text {
		id: all
		text: "All"
		color: theme.accent
		font.bold: true
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		left: profileIcon.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(32*screenRatio)
	}

}

	MouseArea {
		id: all_mouse
		anchors.fill: all
		onClicked: {
			currentCollectionIndex = 2
			navigate('Software')
			return;
	}

}

	//Favorite games

	Text {
		id: favorite
		text: "Favorite"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		left: all.right; leftMargin: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(20*screenRatio)
	}   

}

	MouseArea {
		id: favorite_mouse
		anchors.fill: favorite
		onClicked: {
			currentCollectionIndex = 0
			navigate('Software')
			return;
	}

}

	//Played games

	Text {
		id: played
		text: "Played"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		left: favorite.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}    

}

	MouseArea {
		id: played_mouse
		anchors.fill: played
		onClicked: {
			currentCollectionIndex = 1
			navigate('Software')
			return;
	}

}

	//Search content

	Text {
		id: search
		text: "Search"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		visible: currentPage === 'Software' ? true : false

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		left: played.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

}

	MouseArea {
		id: search_mouse
		anchors.fill: search
		onClicked: {
			searchValue = ''
			header__search_input.clear()         
			header__search_input.focus = true
			return;
	}

}

}
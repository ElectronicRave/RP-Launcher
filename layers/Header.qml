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
		width: aspectRatio === 43 ? 3 : 130
		color: "transparent"
		visible: headerHeightCorrection === 0 ? 1 : 0

	anchors {
		right: parent.right; rightMargin: aspectRatio === 43 ? 16 : -18
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 36
	}

	Image {
		id: header__battery_icon
		height: aspectRatio === 43 ? 16 : 30
		fillMode: Image.PreserveAspectFit
		source: getBatteryIcon()
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 6
		right: header__battery_level.left; rightMargin: aspectRatio === 43 ? 3 : 8
	}

	//Battery levels

	property var level

	function getBatteryIcon() {
			if (level >= 0 && level <= 20)
			return "../assets/icons/battery_empty.svg"
		else
			if (level >= 21 && level <= 40)
			return "../assets/icons/battery_quarter.svg"
		else
			if (level >= 41 && level <= 60)
			return "../assets/icons/battery_half.svg"
		else
			if (level >= 61 && level <= 80)
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
		font.pixelSize: screenRatio === 43 ? 18 : 26
		font.bold: true

		anchors {
			top: parent.top; topMargin: aspectRatio === 43 ? 3 : 5
		}

}

		Image {
			id: header__battery_icon_charging
			width: aspectRatio === 43 ? 16 : 25
			height: width
			fillMode: Image.PreserveAspectFit
			source: "../assets/icons/charge.png"
			sourceSize.width: aspectRatio === 43 ? 12 : 10
			sourceSize.height: aspectRatio === 43 ? 12 : 15
			smooth: true
			visible: chargingStatus && header__battery_icon.level < 100
                   
		anchors {
			top: parent.top; topMargin: aspectRatio === 43 ? 3 : 9
			right: header__battery_icon.right; rightMargin: aspectRatio === 43 ? 3 : 24
		}

}

}

	//Profile icon

	Image {
		id: profileIcon
		width: aspectRatio === 43 ? 3 : 68
		height: width
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/profile.png"
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 32
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 34
	}

}

	MouseArea {
		anchors.fill: profileIcon
		onPressAndHold:{
			swapTheme()
	}

}

	//All games

	Text {
		id: all
		text: "All"
		color: theme.accent
		font.bold: true
		font.pixelSize: screenRatio === 43 ? 3 : 36

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 52
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 160
	}

}

	MouseArea {
		anchors.fill: all
		onClicked: {
			currentCollectionIndex = 2
			navigate('Software')
	}

}

	//Favorite games

	Text {
		id: favorite
		text: "Favorite"
		color: theme.text
		font.pixelSize: screenRatio === 43 ? 3 : 36

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 52
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 250
	}   

}

	MouseArea {
		anchors.fill: favorite
		onClicked: {
			currentCollectionIndex = 0
			navigate('Software')
	}

}

	//Played games

	Text {
		id: played
		text: "Played"
		color: theme.text
		font.pixelSize: screenRatio === 43 ? 3 : 36

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 52
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 410
	}    

}

	MouseArea {
		anchors.fill: played
		onClicked: {
			currentCollectionIndex = 1
			navigate('Software')
	}

}

	//Search games

	Text {
		id: search
		text: "Search"
		color: theme.text
		font.pixelSize: screenRatio === 43 ? 3 : 36
		visible: currentPage === 'Software' ? true : false

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? 3 : 52
		left: parent.left; leftMargin: aspectRatio === 43 ? 3 : 550
	}    

}

	MouseArea {
		anchors.fill: search
		onClicked: {
			searchValue = ''
			header__search_input.clear()         
			header__search_input.focus = true
			return
	}

} 

}
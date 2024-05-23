import QtQuick 2.12
import QtGraphicalEffects 1.12

	Rectangle {
		id: header
		property bool chargingStatus: api.device.batteryCharging
		width: headerCSS.width
		height: headerCSS.height
		color: headerCSS.background
		clip: true

	anchors {
		top: parent.top;
	}

	//Battery status

	Rectangle {
		id: header__battery
        	property real chargingPercent: api.device.batteryPercent*100

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(18*screenRatio)
		right: parent.right
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
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(62*screenRatio) : vpx(62*screenRatio)
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
		id: header__battery_icon_update
		interval: 10000 //Run the timer every 10 seconds
		repeat: true
		running: true
		triggeredOnStart: true
		onTriggered: header__battery_icon.set()
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
			centerIn: header__battery_icon
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
			left: header__battery_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(4*screenRatio)
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
			return
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
		left: profileIcon.right; leftMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(50*screenRatio)
	}

}

	MouseArea {
		id: all_mouse
		anchors.fill: all
		onClicked: {
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 2
			navigate('Software')
			return
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
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 0
			navigate('Software')
			return
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
			searchValue = ""
			header__search_input.clear()
			currentCollectionIndex = 1
			navigate('Software')
			return
	}

}

	//Search content

	Text {
		id: search
		text: "Search"
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(18*screenRatio)
		visible: currentPage === 'Software' ? 1 : 0 ;

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(26*screenRatio)
		left: played.right; leftMargin: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(15*screenRatio)
	}

}

	Rectangle {
		id: header__search
		color: theme.background
		width: aspectRatio === 43 ? vpx(100*screenRatio) : vpx(120*screenRatio)
		height: aspectRatio === 43 ? vpx(28*screenRatio) : vpx(26*screenRatio)
		border.color: theme.text
		border.width: aspectRatio === 43 ? vpx(2*screenRatio) : vpx(1*screenRatio)
		radius: vpx(5*screenRatio)
		visible: searchValue

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(32*screenRatio) : vpx(24*screenRatio)
		left: search.right; leftMargin: aspectRatio === 43 ? vpx(42*screenRatio) : vpx(63*screenRatio)
	}


	Image {
		id: header__search_icon
		sourceSize.width: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(20*screenRatio)
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
		color: theme.text
		font.pixelSize: aspectRatio === 43 ? vpx(16*screenRatio) : vpx(15*screenRatio)
		clip: true

	anchors {
		left: header__search_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		right: header__search.right; rightMargin: aspectRatio === 43 ? vpx(12*screenRatio) : vpx(12*screenRatio)
		verticalCenter: header__search.verticalCenter
	}

	onTextEdited: {
		gameView.currentIndex = 0
		searchValue = header__search_input.text
		gameView.model = searchGames
	}

	Keys.onPressed: {
		if (api.keys.isAccept(event)) {
		navigate('Software')
		return
	}  
        if (event.key === Qt.Key_Down) {
		navigate('Software')
		return
	}

}

}
 
}

	MouseArea {
		id: search_mouse
		anchors.fill: search
		onClicked: {
			searchValue = ""
			header__search_input.clear()
			header__search_input.focus = true
			return
	}

}

}
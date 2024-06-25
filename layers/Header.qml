import QtQuick 2.15
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
		visible: api.device.batteryPercent ? 1 : 0

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(18*screenRatio)
		right: parent.right
	}

	Image {
		id: header__battery_icon
		sourceSize.width: aspectRatio === 43 ? vpx(40*screenRatio) : vpx(29*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: getBatteryIcon()
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(3*screenRatio) : vpx(3*screenRatio)
		right: parent.right; rightMargin: aspectRatio === 43 ? vpx(62*screenRatio) : vpx(60*screenRatio)
	}

	//Battery levels

	property var level

	function getBatteryIcon() {
			if (level >= 0 && level <= 21)
			return "../assets/icons/battery_empty.png"
		else
			if (level >= 21 && level <= 41)
			return "../assets/icons/battery_quarter.png"
		else
			if (level >= 41 && level <= 61)
			return "../assets/icons/battery_half.png"
		else
			if (level >= 61 && level <= 81)
			return "../assets/icons/battery_three_quarters.png"
		else
			if (level >= 81 && level <= 100)
			return "../assets/icons/battery_full.png"
		else
			return "../assets/icons/battery_empty.png"
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
			sourceSize.width: aspectRatio === 43 ? vpx(20*screenRatio) : vpx(15*screenRatio)
			fillMode: Image.PreserveAspectFit
			source: "../assets/icons/charge.png"
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
		font.pixelSize: aspectRatio === 43 ? vpx(15*screenRatio) : vpx(13*screenRatio)
		font.bold: true

		anchors {
			top: parent.top; topMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(2*screenRatio)
			left: header__battery_icon.right; leftMargin: aspectRatio === 43 ? vpx(4*screenRatio) : vpx(3*screenRatio)
		}

}

}

}
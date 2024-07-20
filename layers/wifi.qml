import QtQuick 2.15
import QtGraphicalEffects 1.12

	Rectangle {
		width: aspectRatio === 43 ? vpx(24*screenRatio) : vpx(20*screenRatio)
		height: width
		color: "transparent"
		visible: false //Waiting for the integration of the api responsible for network detection

	Image {
		id: wifi_icon
		sourceSize.width: aspectRatio === 43 ? vpx(30*screenRatio) : vpx(26*screenRatio)
		fillMode: Image.PreserveAspectFit
		source: "../assets/icons/wifi.png"
		layer.enabled: true
		layer.effect: ColorOverlay { color: theme.title }
		smooth: true

	anchors {
		centerIn: parent
	}

}
	anchors {
		top: parent.top; topMargin: aspectRatio === 43 ? vpx(18*screenRatio) : vpx(18*screenRatio)
		right: battery.left; rightMargin: aspectRatio === 43 ? vpx(130*screenRatio) : vpx(110*screenRatio)
	}

}
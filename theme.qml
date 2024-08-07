import QtQuick 2.15
import SortFilterProxyModel 0.2
import "layers" as Layers


	FocusScope {
		id: root

	//Variables and functions

	//System index from memory so we can remember the last system we were in

	property var currentCollection: allCollections[currentCollectionIndex]

	property var currentCollectionIndex: api.memory.get('currentCollectionIndex', currentCollectionIndex);

	//We show the game list if we have stored the collection ID

	property var currentPage: currentCollectionIndex ? 'Software' : 'Home';

	//Game index

	property var currentGameIndex: 0

	property var currentGame: {
		if (currentCollection.shortName === "all-favorites")
		return api.allGames.get(allFavorites.mapToSource(currentGameIndex))

		if (currentCollection.shortName === "all-lastplayed")
		return api.allGames.get(allLastPlayed.mapToSource(currentGameIndex))

		if (searchValue !== '')
		return  currentCollection.games.get(searchGames.mapToSource(currentGameIndex))   
		return currentCollection.games.get(currentGameIndex)
	}

	//We remove the favorite, lastplayed, etc collections so we can put them in another place

	property var allCollections: {
		const collections = api.collections.toVarArray()
		collections.unshift ({"name": "All Games", "shortName": "all-games", "games": api.allGames})
		collections.unshift ({"name": "Last Played", "shortName": "all-lastplayed", "games": filterLastPlayed})
		collections.unshift ({"name": "Favorites", "shortName": "all-favorites", "games": allFavorites})
		return collections
	}

	property var allCollectionsHome: {
		const collections = api.collections.toVarArray()
		collections.unshift ({"name": "ALL SELECT PLATFORM GAMES", "shortName": "all-games", "games": api.allGames})
		return collections
	}

	//Theme system fonts

	FontLoader { id: titleFontBold; source: "assets/fonts/Juhl_W00_ExtraBold.ttf" }

	//Memorizes the condition of the theme

	property var theme : api.memory.get('theme') === 'themeDark' ? themeDark : themeLight ;

	property var themeLight : {
		"background": "#ECECEC",
		"accent": "#F44336",
		"buttons": "#FFBD88",
		"text": "#000000",
		"title": "#2C2C2C",
		"select": "#A9A9A9",
	}

	property var themeDark : {
		"background": "#2C2C2C",
		"accent": "#00FFFF",
		"buttons": "#CD7F32",
		"text": "#FFFFFF",
		"title": "#ECECEC",
		"select": "#4C4C4C",
	}

	//Change theme color

	function swapTheme(){
		if (theme === themeLight){
			api.memory.set('theme', 'themeDark');
		}

		else if (theme === themeDark){
			api.memory.set('theme', 'themeLight');
		}

	}

	//Calculates the number of items and columns to be displayed

	property var numcolumns: aspectRatio === 43 ? 3 : 4;

	//Calculates screen ratio

	property var screenRatio: root.height < 481 ? 1.98 : 1.88;

	//calculates screen proportion

	property real screenProportion: root.width / root.height;

	//calculates screen aspect

	property var aspectRatio : calculateAspectRatio(screenProportion)

	function calculateAspectRatio(screenProportion){
		if (screenProportion < 1.34){
		return 43;
	}
		return 169;
}

	//Percentage calculator

	function vw(pixel){
		switch (aspectRatio) {
		case 43:
		return vpx(pixel*12.8)
		case 169:
		return vpx(pixel*12.8)
		default:
		return vpx(pixel*12.8)
	}

}

	//Used to hide or show the header

	property var wrapperCSS : {
		"width": parent.width,
		"height": parent.height,
		"background": theme.background,      
	}

	property var headerCSS : {
		"width": wrapperCSS.width,
	        "height": aspectRatio === 43 ? vpx(75*screenRatio) : vpx(60*screenRatio),
		"background": "transparent",
	}

	property var mainCSS : {
		"width": wrapperCSS.width,
		"height": wrapperCSS.height - headerCSS.height - footerCSS.height,
		"background": "transparent",
	}

	property var footerCSS : {
		"width": wrapperCSS.width,
		"height": aspectRatio === 43 ? vpx(65*screenRatio) : vpx(65*screenRatio),
		"background": "transparent",
	}

	//Enable the search box feature

	property string searchValue: '';

	//Navigation pages

	function navigate(page){
		currentPage = page
		/*pageNames
		'Home'
		'Software'
		*/
	}

	property int maximumPlayedGames: {
		if (allLastPlayed.count >= 17) {
		return 17
	}
		return allLastPlayed.count
}

	SortFilterProxyModel {
		id: allFavorites
		sourceModel: api.allGames
		filters: ValueFilter { roleName: "favorite"; value: true; }
}

	SortFilterProxyModel {
		id: allLastPlayed
		sourceModel: api.allGames
		filters: ValueFilter { roleName: "lastPlayed"; value: ""; inverted: true; }
		sorters: RoleSorter { roleName: "lastPlayed"; sortOrder: Qt.DescendingOrder }
}

	SortFilterProxyModel {
		id: filterLastPlayed
		sourceModel: allLastPlayed
		filters: IndexFilter { maximumIndex: maximumPlayedGames }
}

	SortFilterProxyModel {
		id: currentFavorites
		sourceModel: currentCollection.games
		filters: ValueFilter { roleName: "favorite"; value: true; }
}
   
	SortFilterProxyModel {
		id: searchGames
		sourceModel: currentCollection.games

		filters: [            
			RegExpFilter { roleName: "title"; pattern: searchValue; caseSensitivity: Qt.CaseInsensitive; enabled: searchValue != "" }                       
		]

}
 
	//Screen boundaries

	Rectangle {
		id: wrapper
		width: wrapperCSS.width
		height: wrapperCSS.height
		color: wrapperCSS.background
}

	anchors {
		top: parent.top;
	}

	Layers.Home {
		id: home
		visible: currentPage === 'Home' ? 1 : 0 ;
	}
    
	Layers.Software {
		id: software
		visible: currentPage === 'Software' ? 1 : 0 ;
	}

}

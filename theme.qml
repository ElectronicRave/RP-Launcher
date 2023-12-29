import QtQuick 2.15
import QtGraphicalEffects 1.12
import QtMultimedia 5.9
import SortFilterProxyModel 0.2
import "layers" as Layers


FocusScope {
    id: root

  //Variables and functions

  //System index from memory so we can remember the last system we were in
 property var currentCollectionIndexMemory : api.memory.get('currentCollectionIndex', currentCollectionIndex);
 property var currentCollectionIndex: {
     if(currentCollectionIndexMemory)
    return currentCollectionIndexMemory;
    if(!currentCollectionIndexMemory)
    return 0
 }

  property var currentCollection: allCollections[currentCollectionIndex]

  //Games index
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
      let collections = api.collections.toVarArray()
      collections.unshift({"name": "All Games", "shortName": "all-allgames", "games": api.allGames})      
      collections.unshift({"name": "Last Played", "shortName": "all-lastplayed", "games": filterLastPlayed})
      collections.unshift({"name": "Favorites", "shortName": "all-favorites", "games": allFavorites})
      return collections
  }  

  FontLoader { id: titleFont; source: "assets/fonts/Nintendo_Switch_UI_Font.ttf" }

  // We show the game list if we have stored the collection ID
  property var currentPage : currentCollectionIndexMemory ? 'Software' : 'Home';

  //Memorizes the condition of the theme
  property var theme : api.memory.get('theme') === 'themeDark' ? themeDark : themeLight ;

  property var themeLight : {
      "background": "#EBEBEB",
      "accent": "#FF0000",
      "buttons": "#FFBD88",
      "text": "#000000",
      "title": "#000000",
  }

  property var themeDark : {
      "background": "#2C2C2C",
      "accent": "#10ADC5",
      "buttons": "#B06500",
      "text": "#FFFFFF",
      "title": "#FFFFFF",
  }

  //Enable the search box feature
  property var searchValue: '';

  property var screenRatio: root.height < 481 ? 1.98 : 1.88;

  property var screenProportion: root.width / root.height;

  function calculateAspectRatio(screenProportion){
    if (screenProportion < 1.34){
      return 43;
    }
      return 169;
 }

  property var aspectRatio : calculateAspectRatio(screenProportion)

  //Used to hide or show the header
  property var headerHeightCorrection: api.memory.get('headerHeightCorrection') === headerCSS.height ? headerCSS.height : 0;
  property var wrapperCSS : {
      "width": parent.width,
      "height": parent.height,
      "background": theme.background,      
  }

  property var headerCSS : {
      "width": wrapperCSS.width,
      "height": aspectRatio == 43 ? 90 : 135,
      "background": "transparent",
  }

  property var mainCSS : {
      "width": wrapperCSS.width,
      "height": wrapperCSS.height - headerCSS.height - footerCSS.height,
      "background": "transparent",
  }

  property var footerCSS : {
      "width": wrapperCSS.width,
      "height": aspectRatio == 43 ? 74 : 90,
      "background": "transparent",
  }

  //Percentage calculator
  function vw(pixel){

  switch (aspectRatio) {
      case 43:
      return vpx(pixel*12.8)
      break;
      case 169:
      return vpx(pixel*12.8)
      break;
      default:
      return vpx(pixel*12.8)
      break;
   }

 }

  //Change the theme color
  
  function swapTheme(){
    if(theme === themeDark){
            api.memory.set('theme', 'themeLight');
        }
        else{
            api.memory.set('theme', 'themeDark');
        }
  }

  //Change pages

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
      color: wrapperCSS.background
      width: wrapperCSS.width
      height: wrapperCSS.height
      anchors.top: parent.top

    Layers.Home {
      visible: currentPage === 'Home' ? 1 : 0 ;
    }
    
    Layers.Software {
      visible: currentPage === 'Software' ? 1 : 0 ;
    }

  }

}
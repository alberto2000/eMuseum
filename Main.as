package {

	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	
	import com.greensock.TweenLite;
	import com.greensock.TweenMax;
	
	import globals;
	import GUIelement;
	import ImageObj;
	
	public class Main extends Sprite {
	
		public function Main(): void {
		
			// setup environment
			addEventListener(Event.ADDED_TO_STAGE, initEnd);
		
		}
		
		public function initEnd(inEvent: Event): void {
		
			removeEventListener (Event.ADDED_TO_STAGE, initEnd);
			
			// save stage reference to globals
			globals.myStage = this;
			
			// create gui elements
			createMainArea();
			createHeader();
			createFilter();
			createSuggestions();
			createLabelTotalResults();
			createPager();
			
			// load random images
			createRandomImages();
		
		}
		
		public function createMainArea(): void {
		
			var mainArea: GUIelement = new GUIelement("mainArea");
		
		}
		
		public function createHeader(): void {
		
			// create app title
			var labelAppTitle: GUIelement = new GUIelement("labelAppTitle");
			
			// create search input field
			var inputNewSearch: GUIelement = new GUIelement("inputNewSearch");
			
			// create horizontal rule
			var horizontalRule: GUIelement = new GUIelement("horizontalRule");
		
		}
		
		public function createFilter(): void {
		
			// create filter area
			var areaFilter: GUIelement = new GUIelement("areaFilter");
			
			// create new filter input field
			var inputNewFilter: GUIelement = new GUIelement("inputNewFilter");
			
			// create refresh button
			var buttonRefresh: GUIelement = new GUIelement("buttonRefresh");
		
		}
		
		public function createSuggestions(): void {
		
			// create suggestions area
			var areaSuggestions: GUIelement = new GUIelement("areaSuggestions");
			
			// create suggestions title
			var titleSuggestions: GUIelement = new GUIelement("titleSuggestions");
		
		}
		
		public function createLabelTotalResults(): void {
		
			// create total result count
			var labelTotalResults: GUIelement = new GUIelement("labelTotalResults");
		
		}
		
		public function createPager(): void {
		
			// create page label
			var labelPage: GUIelement = new GUIelement("labelPage");
			
			// create page back button
			var buttonPageBack: GUIelement = new GUIelement("buttonPageBack");
			
			// create label page current
			var labelPageCurrent: GUIelement = new GUIelement("labelPageCurrent");
			
			// create page forward button
			var buttonPageForward: GUIelement = new GUIelement("buttonPageForward");
			
			// create 'of' label
			var labelPageOf: GUIelement = new GUIelement("labelPageOf");
			
			// create page total label
			var labelPageTotal: GUIelement = new GUIelement("labelPageTotal");
		
		}
		
		public function createRandomImages(): void {
		
			if (globals.imgList.length > 0) {
			
				destroyImgList();
			
			}
			
			globals.searchIDs = [];
	
			// create 12 images
			for (var i: Number = 0; i <= 11; i++) {
			
				// random id
				var rndID: Number = Math.round(Math.random() * 6000) + 2500;
				
				// fill searchIDs
				globals.searchIDs.push(rndID);
				
			}
			
			var newImageDisplay: ImageDisplay = new ImageDisplay(globals.searchIDs);
			globals.guiObjects["labelTotalResults"].text = "Current total results   " + globals.searchIDs.length;
			
			trace("Main: loading random images");
			
		}
		
		public function destroyImgList(): void {
		
			for (var j: Number = 0; j <= globals.imgList.length - 1; j++) {
			
				globals.myStage.removeChild(globals.imgList[j]);
			
			}
			
			// clear image list
			globals.imgList = [];
			
		}
		
		public function destroyActiveFilters(): void {
		
			for (var j: Number = 0; j <= globals.activeFilters.length - 1; j++) {
			
				globals.myStage.removeChild(globals.activeFilters[j]);
			
			}
			
			// clear filter list
			globals.activeFilters = [];
			
		}
		
		public function destroyActiveSuggestions(): void {
		
			for (var j: Number = 0; j <= globals.activeSuggestions.length - 1; j++) {
			
				globals.myStage.removeChild(globals.activeSuggestions[j]);
			
			}
			
			// clear filter list
			globals.activeSuggestions = [];
			
		}
		
		public function destroySingleImage(): void {
		
			if (globals.singleImage[0]) {
				globals.myStage.removeChild(globals.singleImage[0]);
				globals.singleImage = [];
			}
		
		}
		
		public function destroyMetaView(inWithImgList: Boolean = false): void {
		
			if (inWithImgList == false) {
		
				for each (var newImg in globals.imgList) {
					TweenLite.to(newImg, 1, {alpha:1});
				}
			
			} else {
				destroyImgList();
			}
			
			TweenLite.to(globals.guiObjects["labelTotalResults"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPage"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonPageBack"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageCurrent"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["buttonPageForward"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageOf"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["labelPageTotal"], 1, {alpha:1});
			TweenLite.to(globals.guiObjects["infoRule"], 1, {alpha:1});
			
			if (globals.metaView[0]) {
				globals.myStage.removeChild(globals.metaView[0]);
				globals.metaView = [];
			}
		
		}
	
	}
	
}
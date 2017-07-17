import flash.display.Sprite;
import flash.ui.Keyboard;
import flash.display.MovieClip;
import flash.events.KeyboardEvent;

'Move Variables'
var moves: Vector.<Array>= new Vector.<Array>();
var paths: Vector.<Array>=new Vector.<Array>();
'Tile Spawn Variables'
var grid: Sprite = new Sprite();
addChild(grid);
var xval: Number = 0;
var yval: Number = 0;
'Spawning Tiles'
for (var i: uint = 1; i <= 64; i++) {
	var tiles: Tile = new Tile();
	grid.addChild(tiles);
	tiles.x += xval;
	tiles.y += yval;
	xval += 100;
	if (xval >= 800) {
		yval += 100;
		xval = 0;
	}
}
'Button Listener'
stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyPressed);

function KeyPressed(evt: KeyboardEvent): void {
	'Space Key - To create a new Seed'
	if (evt.keyCode == Keyboard.SPACE) {
		'Move Reset'
		moves = new Vector.<Array>;
		'New Seed'
		for (var i: uint = 0; i < grid.numChildren; i++) {
			if (Math.round(Math.random() * 2) == 0 && i != 0 && i != 63) {
				grid.getChildAt(i).alpha = 1;
			}
			else {
				grid.getChildAt(i).alpha = 0.5;
			}
		}
	'Enter Key - To run Algorithm'
	}else if (evt.keyCode == Keyboard.ENTER) {
		'Check valid moves'
		function MoveTo(xpos, ypos): String {
			for (var j: uint = 0; j < grid.numChildren; j++) {
				var child: MovieClip = MovieClip(grid.getChildAt(j));
				if (child.x == xpos && child.y == ypos && child.alpha == 0.5) {
					return child.name;
				}
				else if (child.x == xpos && child.y == ypos && child.alpha == 1) {
					return "Null";
				}
			}
			return "Null";
		}
		'Algorithm'
	}
}
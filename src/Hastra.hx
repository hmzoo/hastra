package;
import hastra.*;

@:expose
class Hastra extends hxd.App {
	var infos:h2d.Text;
	var grid:hastra.Grid;

	override function init() {
		// Spécifiez le nouvel id du canvas ici
		infos = new h2d.Text(hxd.res.DefaultFont.get());
		s2d.scaleMode = Resize;
		s2d.addChild(infos);

		grid= new hastra.Grid();
		grid.x= 50;
		grid.y= 50;
		s2d.addChild(grid);
	}

	override function update(dt:Float) {
		infos.text = "DT:" + dt;
		updated();
	}

	override function onResize() {
		super.onResize();
		var w = hxd.Window.getInstance().width;
		var h = hxd.Window.getInstance().height;
	}

	public static var inst:Hastra;

	//access
	static dynamic function updated() {  }
	public static function testit(){
		trace("YES");
	}

	static function main() {
		
		inst = new Hastra();
	}
}

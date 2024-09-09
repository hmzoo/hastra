package;
import hastra.*;

@:expose
class Hastra extends hxd.App {
	var infos:h2d.Text;
	var grid:hastra.Grid;
	public var data:String;

	override function init() {
		// Spécifiez le nouvel id du canvas ici
		infos = new h2d.Text(hxd.res.DefaultFont.get());
		s2d.scaleMode = Resize;
		s2d.addChild(infos);

		grid= new hastra.Grid();
		grid.x= 50;
		grid.y= 50;
		s2d.addChild(grid);
		data="";
	}

	override function update(dt:Float) {
		//infos.text = "DT:" + dt;
		if (grid.data != data){
			data=grid.data;
			updated(data);
		}		
	}

	override function onResize() {
		super.onResize();
		var w = hxd.Window.getInstance().width;
		var h = hxd.Window.getInstance().height;
	}

	public static var inst:Hastra;

	//access
	static dynamic function updated(d) {  trace(d);}


	static function main() {
		
		inst = new Hastra();
	}
}

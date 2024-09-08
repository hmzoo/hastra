package;

import h3d.shader.ColorKey;
import hastra.*;

// @:native("window")
class MainApp extends hxd.App {
	var infos:h2d.Text;
	var ct:Float;
	var st:Float;

	var motor:hastra.Motor;
    var clock:hastra.Clock;
    var target:hastra.Target;

	override function init() {
		infos = new h2d.Text(hxd.res.DefaultFont.get());
		//
		motor = new Motor(360);

        clock =new Clock();
        clock.x=40;
        clock.y=40;

        target=new Target(1,1,0.1);

		s2d.scaleMode = Resize;
		s2d.addChild(infos);
        s2d.addChild(clock);



		ct = 0;
		st = 0;
	}

	override function update(dt:Float) {
	
		motor.update(dt);
        clock.setAngle(motor.angle);
		infos.text = "FRAME:" + motor.getFrame()+" DURATION:"+motor.getDuration()+"ANGLE: "+motor.angle;
	}

	override function onResize() {
		super.onResize();
		var w = hxd.Window.getInstance().width;
		var h = hxd.Window.getInstance().height;
	}

	public static var inst:MainApp;

	static function main() {
		inst = new MainApp();
	}
}

package hastra;

class Motor {
	var rate:Float;
	var frame:Float;
	var maxframe:Float;
	var duration:Float;
	var ft:Float;
	public var angle:Float;

	public function new(n:Float) {
		maxframe=n;
		reset();
	}

	public function reset(){
		duration =0;
		frame = 0;
		ft = 0;
		rate = 1 / 24;
		angle=0;
	}

	public function update(dt:Float) {
		ft = ft + dt;
		duration=duration+dt;
		if (ft >= rate) {
			ft = ft - rate;
			frame = frame + 1;
			if (frame >=maxframe){ frame=frame-maxframe;duration=0;}
			angle=(frame/maxframe)*2*Math.PI;
		}
		
	}

	public function getFrame():Float {
		return frame;
	}
	public function getDuration():Float {
		return duration;
	}
}

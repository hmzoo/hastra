package hastra;

final color_line = 0x2399BD;

class Clock extends h2d.Object  {

    var g:h2d.Graphics;
    var W:Float;
    var angle:Float;

    public function new() {
		super();
        g = new h2d.Graphics(this);
        W=64;
        angle=0;
    }

    public function setAngle(a){
        g.clear();
        var r=W/2;
        var x=r+r*Math.cos(a);
        var y=r-r*Math.sin(a);
        g.lineStyle(1, color_line);
        g.drawCircle(r,r,r);
        g.drawCircle(x,y,3);
    }


}
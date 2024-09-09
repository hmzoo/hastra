package hastra;

final color_grid = 0x2399BD;
final color_pointer = 0x11E7A7;

class Grid extends h2d.Object  {

    var infos:h2d.Text;

    var g:h2d.Graphics;
    var gpointer:h2d.Graphics;
    var itv:h2d.Interactive;
    var W:Float;

    var pr:Float;
    var px:Float;
    var py:Float;
    var data:String;

    var target:Target;

    public function new() {
		super();
        g = new h2d.Graphics(this);
        W=200;
        px=W/2;
        py=W/2;
        pr=W/20;

        infos = new h2d.Text(hxd.res.DefaultFont.get());
		infos.x=W+10;
        infos.y=10;
		this.addChild(infos);

        target=new Target();
        calcTarget();

        for(i in 0...21){
            g.lineStyle(1, color_grid);
            if(i==10){g.lineStyle(3, color_grid);}
            if(i==15 || i == 5 ){g.lineStyle(2, color_grid);}
            g.moveTo(i*W/20,0);
            g.lineTo(i*W/20,W);
            g.moveTo(0,i*W/20);
            g.lineTo(W,i*W/20);
        }
        gpointer = new h2d.Graphics(this);
        itv = new h2d.Interactive(W, W, this);
        itv.onRelease = this.onRelease;
        itv.onMove = this.onMove;
        itv.onWheel = this.onWheel;



        draw_pointer();
    }

    public function draw_pointer(){
        gpointer.clear();
        gpointer.lineStyle(1, color_pointer);
        gpointer.drawCircle(px,py,pr);
        calcTarget();
    }

    function onRelease(e:hxd.Event){
        trace(data);
        data=haxe.Json.stringify(target,"\t");
        trace(data);
    }

    function onMove(e:hxd.Event){
        px=e.relX;
        py=e.relY;
        draw_pointer();
    }
    function onWheel(e:hxd.Event){
        pr=pr+e.wheelDelta;
        draw_pointer();
    }

    

    function calcTarget(){
        var x=px/(W/2);
        var y=(W-py)/(W/2);
        var r=pr/(W/2);
        target.calc(x,y,r);
        var i="X: "+target.x+"\nY: "+target.y+"\nR: "+target.r+"\nSTEPS: "+target.steps;
        infos.text = i;
    }


}
package hastra;

class Tplot {
    var n:Int;
    var x:Float;
    var y:Float;

    public function new(sn,sx,sy){
        x=sx;
        y=sy;
        n=sn;
    }
}

class Target {

    var vit:Float;
    var r:Float;
    var x:Float;
    var y:Float;
    var step:Float;

    var tplots:Array<Tplot>;

    public function new(sx,sy,sr) {
        x=sx;
        y=sy;
        r=sr;
        var tplots=[];
        
        vit=(2*Math.PI/360)/9;


        var p=r*2*Math.PI;
        var pvit=Math.floor(p/vit);
        var pang=2*Math.PI/pvit;
        for (i in 0...pvit) {
            var px=x+r*Math.cos(pang*i);
            var py=y-r*Math.sin(pang*i);
            tplots.push(new Tplot(i,px,py));
        }
        trace(haxe.Json.stringify(tplots,"\t"));

		

    }




}
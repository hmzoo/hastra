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

    public var vit:Float;
    public var r:Float;
    public var x:Float;
    public var y:Float;
    public var steps:Float;

    var tplots:Array<Tplot>;

    public function new() {
       
       // trace(haxe.Json.stringify(tplots,"\t"))
    }

    public function calc(sx,sy,sr) {

        var rat=12;
        x=sx;
        y=sy;
        r=sr;
        tplots=[];
        
        vit=(2*Math.PI/360)/rat;


        var p=r*2*Math.PI;
        var pvit=Math.floor(p/vit);
        var pang=2*Math.PI/pvit;
        for (i in 0...pvit) {
            var px=x+r*Math.cos(pang*i);
            var py=y+r*Math.sin(pang*i);
            tplots.push(new Tplot(i,px,py));
        }
        steps= tplots.length;
        
    }



}
# hastra

## Install Haxe and Heaps

~~~bash
# install Haxe

sudo add-apt-repository ppa:haxe/releases -y
sudo apt-get update
sudo apt-get install haxe -y
mkdir ~/haxelib && haxelib setup ~/haxelib

# Conf proxy
haxe proxy
haxelib install heaps -R http://lib.haxe.org/

# install heaps

haxelib install heaps
~~~

## preparation du projet


### Application classique

► Dossier ./src
main.js
~~~haxe

package;

class Main extends hxd.App {
	var infos:h2d.Text;

	override function init() {
		infos = new h2d.Text(hxd.res.DefaultFont.get());
		s2d.scaleMode = Resize;
		s2d.addChild(infos);
	}

	override function update(dt:Float) {
		infos.text = "DT:" + dt;
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


~~~ 



► dossier ./dist
index.html 
~~~html
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8"/>
    <title>Hello Heaps</title>
    <style>
        body { margin:0;padding:0;background-color:white; }
        canvas#webgl { width:100%;height:100%; } 
    </style>
</head>
<body>
    <canvas id="webgl"></canvas>
    <script type="text/javascript" src="main.js"></script>
</body>
</html>
~~~

► a la racine

compile_main_js.hxml
~~~
-cp src
-lib heaps
-main Main
-js ./dist/main.js
-debug
~~~

COMPILATIONS :

~~~ bash
haxe  compile_main_js.hxml
~~~

Lancer un simple serveur web
~~~bash
python3 -m http.server -d ./dist
~~~
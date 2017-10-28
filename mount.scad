use <library/Utils.scad>
//29 mm across mid 3mm hole to hole

width = 60; // mm width

//26mm depth
holeToHole = 26.5; 
holeWidth = 3.5; 

mountHeight = 100;
mountWidth = 8;

holeHeight = 45; // Height from where the mount holes start

$fn = 50;
//move(x=6-holeWidth/2, z=0, y=mountWidth+1, rx=90)cylinder(h=mountWidth + 2, d=holeWidth);
union() {
	frame();
	base();
}


module frame(){
	difference(){
		union() {
			cube([mountWidth,mountWidth,mountHeight]);
			move(x=width - mountWidth) cube([mountWidth,mountWidth,mountHeight]);
			move( y=4, z=100-mountWidth+4, ry=90)cylinder(d=6, h= width, center=false);
		}
		for(a=[holeHeight: 5: mountHeight - 5]){
			move(x=6-holeWidth/2, z=a, y=mountWidth+1, rx=90)
				cylinder(h=mountWidth + 2, d=holeWidth);
			
			move(x=width - 6 + holeWidth/2, z=a, y=mountWidth+1, rx=90)
				cylinder(h=mountWidth + 2, d=holeWidth);
		}
	}
}


//26.36 inside width of hole 32.7 
module base(){
	difference(){
		cube([width, 25, 3] );
		sideToHole = (width - holeToHole - holeWidth)/2;

		move(y=8, x=sideToHole) cylinder(h =5, d=holeWidth);
		move(y=8, x=width-sideToHole  ) cylinder(h =5, d=holeWidth);

		move(y=20, x=7  ) cylinder(h =5, d =6);
		move(y=20, x=width - 7  ) cylinder(h =5, d =6);
	}
}
	
use <library/Utils.scad>
//29 mm across mid 3mm hole to hole

width = 60; // mm width

//26mm depth
holeToHole = 29; 
holeWidth = 3;

mountHeight = 100;
mountWidth = 8;

$fn = 100;
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
		for(a=[6: 5: mountHeight]){
			move(x=6-holeWidth/2, z=a, y=mountWidth+1, rx=90)
				cylinder(h=mountWidth + 2, d=holeWidth);
			
			move(x=width - 6 + holeWidth/2, z=a, y=mountWidth+1, rx=90)
				cylinder(h=mountWidth + 2, d=holeWidth);
		}
	}
}

module base(){
	difference(){
		cube([width, 25, 3] );
		sideToHole = (60 - 29 - 3)/2;

		move(y=10, x=sideToHole) cylinder(h =5, d=holeWidth);
		move(y=10, x=60- sideToHole  ) cylinder(h =5, d=holeWidth);

		move(y=20, x=10  ) cylinder(h =5, d =4);
		move(y=20, x=width - 10  ) cylinder(h =5, d =4);
	}
}
	
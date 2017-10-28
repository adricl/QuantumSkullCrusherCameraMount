use <library/Utils.scad>

width = 60;
height = 10;

backing();
move (x= (width-25)/2) mount();

mountWidth=4;

module backing(thickness=1){
	difference() {
		cube([width, height, thickness]);
		for(a=[2.5: 5: height]){
			holeWidth = 3.5; 
			move(x=6-holeWidth/2, y=a, z=-1)
				cylinder(h=mountWidth + 2, d=holeWidth, $fn=32);
			
			move(x=width - 6 + holeWidth/2, y=a, z=-1)
				cylinder(h=mountWidth + 2, d=holeWidth, $fn=32);
		}
	}

}

module mount(peg=1, x=42, y =25, h = 50){
	mountDepthTop = 29;
	angle=63;

	difference () {
		copy_move(x= x/2) move(x=-mountWidth/2) difference (){
			cube([mountWidth, height, mountDepthTop]);
			move(x=-1, rx=angle)cube([6,40,40]);
		}

		ztranslation=4;
		move(z=ztranslation, rx=angle) translate([0, 0, -50]/2) cylinder(r=peg, h=h, $fn=32);
		move(z=ztranslation, rx=angle) translate([ x, 0, -50]/2) cylinder(r=peg, h=h, $fn=32);
		move(z=ztranslation, rx=angle) translate([0,  y, -50]/2) cylinder(r=peg, h=h, $fn=32);
		move(z=ztranslation, rx=angle) translate([ x,  y ,-50]/2) cylinder(r=peg, h=h, $fn=32);

	}
}


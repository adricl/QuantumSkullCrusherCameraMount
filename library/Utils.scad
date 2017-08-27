module copy_mirror(x=0,y=0,z=0) 
{ 
    children(); 
    mirror([x, y, z]) children(); 
} 

module copy_move(x=0,y=0,z=0,rx=0,ry=0,rz=0) { 
    children(); 
    move(x, y, z, rx, ry, rz) children(); 
} 

module move(x=0, y=0, z=0, rx=0, ry=0, rz=0) { 
	translate([x,y,z])rotate([rx,ry,rz]) children(); 
}

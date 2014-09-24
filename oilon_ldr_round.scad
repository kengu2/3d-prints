/*
Oilon Junior Pro LDR case
Vaasa Hacklab ry 22.8.2014
*/

module roundedRect(size, radius)
{
x = size[0];
y = size[1];
z = size[2];

linear_extrude(height=z)
hull()
{
// place 4 circles in the corners, with the given radius
translate([(-x/2), (-y/2), 0])
circle(r=0.1);

translate([(x/2)-(radius), (-y/2)+(radius), 0])
circle(r=radius);

translate([(-x/2), (y/2), 0])
circle(r=0.1);

translate([(x/2), (y/2), 0])
circle(r=0.1);
}
}



union() {
	translate([-4,8,9])
	rotate([90,0,90])
		difference() {
			cylinder(h = 6, r=4.5, $fn = 100);
			cylinder(h = 8, r=3.5, $fn = 100);

		}

	// klipsi1

	translate([-4,3,7])
#		cube([2,1.5,4]);

	translate([-4,11.5,7])
#		cube([2,1.5,4]);


	// kotelon runko

	rotate([90,0,270])
	translate([-8,40,-9]) {

		difference() {	
			roundedRect([17,80,9],8);

//			cube(size = [16, 9, 50]);
			translate([0,2,0])
				roundedRect([13,80,7],6);
//				cube(size = [14, 7, 50]);
			translate([-7,-30,4])
#				cube(size = [14, 80, 3]);


			translate([0,-31,5])
				rotate([0,0,0])
#					cylinder(h = 5, r=3.5, $fn = 100);
			translate([-10,24,4])
#				cube(size=[20,5,3]);

			translate([-10,14,2])
#				cube(size=[20,5,3]);

			translate([-10,-18,2])
#				cube(size=[20,5,3]);

		}
	}
}


/*
 https://github.com/dannystaple/OpenSCAD-Parts-Library/blob/master/prism.scad
*/
//Draw a prism based on a 
//right angled triangle
//l - length of prism
//w - width of triangle
//h - height of triangle
module prism(l, w, h) {
	translate([0, l, 0]) rotate( a= [90, 0, 0]) 
	linear_extrude(height = l) polygon(points = [
		[0, 0],
		[w, 0],
		[0, h]
	], paths=[[0,1,2,0]]);
}


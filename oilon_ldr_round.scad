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
	// klipsi1
	translate([-4,3,7])
		union() {
			intersection() {
				cube(size = [4, 1, 3]);
				translate([0,1.6,1.5])
					rotate([90,0,90])
						cylinder(h = 4, r=2, $fn = 100);
			}
			intersection() {
				translate([-2,0.5,1.5])
					rotate([90,0,90])
						cylinder(h = 2, r=1.8, $fn = 100);
				rotate([270,0,180])
				translate([0,-3,-1])
					prism(3, 2, 2);
			}
	}

	// klipsi2
	translate([-4,12,7])
		union() {
			intersection() {
				cube(size = [4, 1, 3]);
				translate([0,-0.6,1.5])
					rotate([90,0,90])
						cylinder(h = 4, r=2, $fn = 100);
			}
			intersection() {
				translate([-2,0.5,1.5])
					rotate([90,0,90])
						cylinder(h = 2, r=1.8, $fn = 100);
				rotate([90,0,180])
					prism(3, 2, 2);
			}
		}

	// kotelon runko
//	rotate([0,0,90])
//	translate([0,-9,0])

	rotate([90,0,270])
	translate([-8,25,-9]) {

		difference() {	
			roundedRect([16,50,9],8);

//			cube(size = [16, 9, 50]);
			translate([0,2,0])
				roundedRect([12,50,7],5);
//				cube(size = [14, 7, 50]);
			translate([0,-17,5])
				rotate([0,0,0])
#					cylinder(h = 5, r=3.5, $fn = 100);
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

//rotate([90,0,270])
//	translate([-8,25,-9])
//	roundedRect([16,50,9],5);
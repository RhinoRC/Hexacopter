height = 28;
od = 14;
id = 9.6;
screwd = 1.3;
screwo = 9.4;
thickness = 2.2;
diameter=100;
$fn = 100;

gpssp = 45;
gpsmd = 3.25;
gpsw = 50.5;
apmw = 46;
apml = 72;
apmh = 14;

difference(){
	hull(){
		translate([0,0,40+(2*thickness)])
			cube([gpsw,gpsw,thickness], center=true);


		translate([0,0,30+(2*thickness)])
			hexagon(cle=diameter-20+(2*thickness), h=thickness);

		translate([0,0,20])
			hexagon(cle=diameter+(2*thickness), h=thickness);
	
		hexagon(cle=diameter+(2*thickness), h=thickness);
	}

	translate([0,0,40+thickness]){
		translate([45/2,45/2,0])
			cylinder(h=thickness*10, r=gpsmd/2, center=true);
		translate([-45/2,-45/2,0])
			cylinder(h=thickness*10, r=gpsmd/2, center=true);
		translate([-45/2,45/2,0])
			cylinder(h=thickness*10, r=gpsmd/2, center=true);
		translate([45/2,-45/2,0])
			cylinder(h=thickness*10, r=gpsmd/2, center=true);
	}

	hull(){
		translate([0,0,40])
			cube([gpsw,gpsw,thickness], center=true);

		translate([0,0,30])
				hexagon(cle=diameter-20, h=thickness);

		translate([0,0,20])
			hexagon(cle=diameter, h=thickness);
	
		hexagon(cle=diameter, h=thickness);
	}
}

module hexagon(cle,h)
{
	angle = 360/6;		// 6 pans
	cote = cle * cot(angle);
	echo(angle, cot(angle), cote);
	echo(acos(.6));

	union()
	{
		for( i=[0,angle,2*angle] ){
		rotate([0,0,i])
			cube([cle,cote,h],center=true);
		}
	}
}
function cot(x)=1/tan(x);
height = 28;
od = 14;
id = 9.6;
screwd = 1.3;
screwo = 9.4;
thickness = 2.2;
diameter=100;
batteryw=50;
batteryz=30;
batteryo=3;
$fn = 100;


difference(){
	translate([0,0,batteryo/2])
		cylinder(h=batteryo, r=20, center=true);

	translate([0,0,batteryo/2])
		cylinder(h=batteryo, r=12, center=true);
}

difference(){
	for( i=[0,60,120,180,240,300] ){
		rotate([0,0,i]){
			translate([(diameter/3),0,((batteryo+batteryz)/2)])
				cube([diameter/3,10,batteryo+batteryz], center=true);
		}
	}

	translate([0,0,((batteryz)/2)+batteryo])
		cube([diameter+10,batteryw,batteryz], center=true);
}

difference(){
	//Main Body
	hexagon(cle=diameter, h=thickness);

	//Leg Mounts
	for( i=[0,60,120] ){
		rotate([0,0,i]){
			translate([-diameter/4,(id/2)+(screwd*2),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([diameter/4,(id/2)+(screwd*2),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([-diameter/4,-((id/2)+(screwd*2)),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([diameter/4,-((id/2)+(screwd*2)),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([-diameter/2.2,(id/2)+(screwd*2),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([diameter/2.2,(id/2)+(screwd*2),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([-diameter/2.2,-((id/2)+(screwd*2)),0])
				cylinder(h=thickness+id, r=screwd, center=true);
			translate([diameter/2.2,-((id/2)+(screwd*2)),0])
				cylinder(h=thickness+id, r=screwd, center=true);
		}
	}

	//Center Hole
	cylinder(h=thickness+id, r=12, center=true);

	//Corner Holes
	for( j=[30,90,150] ){
		rotate([0,0,j]){
			translate([diameter/2.5,0,0])
				cylinder(h=thickness+id, r=12, center=true);
			translate([-diameter/2.5,0,0])
				cylinder(h=thickness+id, r=12, center=true);
		}
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
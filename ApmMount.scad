height = 28;
od = 14;
id = 9.6;
screwd = 1.3;
screwo = 9.4;
thickness = 2.2;
diameter=100;
$fn = 100;

apmw = 46;
apml = 72;
apmh = 14;


translate([0,0,(14+5)/2])
difference(){
	cube([46+5,72+5,14+5],center=true);		//APM Container
	translate([0,0,0])
		cube([46,72,14+5],center=true);

	translate([-23,20,1])						//USB Cut-Away
		cube([5,15,14+4],center=true);

	translate([23,0,1])						   //Receiver CutAway
		cube([5,40,14+4],center=true);

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
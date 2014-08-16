height = 28;
od = 14;
id = 9.6;
screwd = 1.3;
screwo = 9.4;

difference(){
	cube(size=[od,od,height],center=true);
	cube(size=[id,id,height],center=true);
	translate([od/2,0,0]){
		rotate([0,90,0]){
			cylinder( h=(od), r=4.2, center=true, $fn=100 );
		}
	}
}

translate([od/2,0,0]){
	rotate([0,90,0]){
		difference(){
			cylinder( h=(od-id)/2, r=height/2, center=true, $fn=100 );
			cylinder( h=(od-id)/2, r=4.2, center=true, $fn=100 );
			translate([0,screwo,0]){
				cylinder( h=(od-id)/2, r=screwd, center=true, $fn=100 );
			}
			translate([0,-screwo,0]){
				cylinder( h=(od-id)/2, r=screwd, center=true, $fn=100 );
			}
		}
	}
}

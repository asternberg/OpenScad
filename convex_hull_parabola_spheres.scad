// Written by A. Sternberg on 4/20/2016
// Use as you wish. With our without attribution.
//
// number of sphere for the convex hull (affects resolution)
n=8; // use an even number

// right most x center of the sphere
rightx=25;

// topz - apex of the parobala on z
topz=25;

// radius of sphere
r=4;

parts=2;// has to be  2 or more - how many parts to connect with convex hull

function xi(i) =  rightx*i/n;
function yi(i) = 0;
function zi(i) = topz*(-i*i+n*i)/(n*n/4);

module convexTrail(){

// start from 0 for a closed shape; 1 for an open shape
for(i=[0:parts-1:n-2]){
    hull()
    {
        for(j=[i:1:i+parts])
            basic_shape(xi(j),yi(j),zi(j));       
    }    
}
}
module basic_shape(x=0,y=0,z=0){
    translate([x,y,z])
    sphere(r=r,center=true);
  
}


difference(){
    convexTrail();
    translate([0,0,r])
        convexTrail();
}
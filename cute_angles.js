///////////////////////
// Problem Statement //
///////////////////////

// Cute angles

// Write a method that takes a floating point number that 
// represents an angle between 0 and 360 degrees and returns 
// a String that represents that angle in degrees, minutes,
// and seconds. You should use a degree symbol (˚) to represent 
// degrees, a single quote (') to represent minutes, and a 
// double quote (") to represent seconds. There are 60 minutes 
// in a degree, and 60 seconds in a minute.

// Examples:

// dms(30) == %(30°00'00")
// dms(76.73) == %(76°43'48")
// dms(254.6) == %(254°36'00")
// dms(93.034773) == %(93°02'05")
// dms(0) == %(0°00'00")
// dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

////////////////
// Psuedocode //
////////////////

// .73 * 60 = 43
// .8 * 60 = 48
// get degree remainder, convert to minutes, if remainder convert to seconds
// format each:
	// convert to integer
	// if length < 2 prepend 0
	// else go ahead

//////////
// Code //
//////////

function dms(degrees) {
	var remainder = (degrees % 1).toFixed(2);
	var degrees = Math.floor(degrees);
	var minutes = remainder * 60;
	remainder = minutes % 1;
	var seconds = remainder * 60;

	degrees = String(parseInt(degrees));	
	minutes = prependZero(parseInt(minutes));
	seconds = prependZero(parseInt(seconds));

	return degrees + "" + minutes "'" + seconds + "\"";
}

function prependZero(intString) {
	if (intString.length == 1) { return "0" + intString };
}



dms(30) == "30^00'00\""
dms(76.73) == "76^43'48\""
dms(254.6) == "254^36'00\""
dms(93.034773) == "93^02'05\""
dms(0) == "0°00'00\""
dms(360) == "360^00'00\"" || dms(360) == "0^00'00\""
///////////////////////
// Problem Statement //
///////////////////////

// 1000 Lights

// You have a bank of switches before you numbered from 1 to 1000. 
// Each switch is connected to exactly one light that is initially 
// off. You walk down the row of switches, and turn every one of 
// them on. Then, you go back to the beginning and toggle switches 
// 2, 4, 6, and so on. Repeat this for switches 3, 6, 9, and so on, 
// and keep going until you have been through 1000 repetitions of 
// this process.

// Write a program that determines how many lights are on at the end, 
// and which lights are off.

// Example with 5 lights:

// round 1: every light is turned on | t t t t t |
// round 2: lights 2 and 4 are now off; 1, 3, 5 are on | t f t f t|
// round 3: lights 2, 3, and 4 are now off; 1 and 5 are on | t f f f t |
// round 4: lights 2 and 3 are now off; 1, 4, and 5 are on | t f f t t | 
// round 5: lights 2, 3, and 5 are now off; 1 and 4 are on | t f f t f | 
// The result is that 2 lights are left on, lights 1 and 4.

// With 10 lights, 3 lights are left on: lights 1, 4, and 9.

////////////////
// Psuedocode //
////////////////

// for any n bank of switches there can be two states for each 
// switch: true or false.
// initially we toggle at mutliples of 1 and then increasing 
// by 1 from thereafter, 
// so for n switches we toggle them n times from 1 up to n.

// We can represent the state of the switches in a hash that contains
// boolean or binary values. Or we could have implicit switch ID by
// index in an array.

// Easier to work with hash randomly.

// create hash with keys 1..1000 and values of false (zero)
// toglle multiples of 1
	// lights[1] = toggle
// toggle multiples of 2
// ...
// toggle multiples of n

// nested for loop, outer increases the mutliple
// inner loop iterates over the bank up to n, counting
// in intervals of the multiple

//////////
// Code //
//////////

function nLights(n) {
	var lightBank = initializeLightBank(n);
	for (var multiple = 1; multiple <= n; multiple++) {
		
		for (var count = multiple; count <= n; count += multiple) {
			lightBank[count] = !lightBank[count];
		}
	}
}

function initializeLightBank(n) {
	var bank = {};
	for (var i = 1; i <= n; i++) {
		bank[i] = false;
	}

	return bank;
}

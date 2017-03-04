
var Year = function(year) {
	this.year = year;
};

Year.prototype.isLeap = function() {

	return this.year % 400 === 0 || (this.year % 4 === 0 && !(this.year % 100 === 0));
}

module.exports = Year;
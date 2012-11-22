function Vector( vector ) {
    this.vector = vector;
}

Vector.prototype.array = function() {
    return this.vector;
};

Vector.prototype.scale = function( lambda ) {
    var A = this.array();

    return new Vector(
        A.map( function( x ) {
            return lambda * x;
        } )
    );
};

Vector.prototype.clone = function() {
    return this.scale( 1 );
};

Vector.prototype.negate = function() {
    return this.scale( -1 );
};

Vector.prototype.add = function( vector ) {
    var A = this.array(),
        B = vector.array();

    return new Vector(
        A.zip( function( x, y ) {
            return x + y;
        }, B )
    );
};

Vector.prototype.subtract = function( vector ) {
    return this.add( vector.negate() );
};

Vector.prototype.dot = function( vector ) {
    var A = this.array(),
        B = vector.array();

    return (
        A.zip( function( x, y ) {
                return x * y;
        }, B ).sum()
    );
};

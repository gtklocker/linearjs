function Vector( vector ) {
    this.vector = vector;
    this.dimension = this.vector.length;
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

Vector.prototype.cross = function( vector ) {
    var A = this.array(),
        B = vector.array();

    return new Vector(
        [
            A[ 1 ] * B[ 2 ] - A[ 2 ] * B[ 1 ],
            A[ 2 ] * B[ 0 ] - A[ 0 ] * B[ 2 ],
            A[ 0 ] * B[ 1 ] - A[ 1 ] * B[ 0 ]
        ]
    );
};

Vector.prototype.norm = function() {
    var A = this.array();
    return Math.sqrt(
        A.map( function( x ) {
            return x * x;
        } ).sum()
    );
};

Vector.prototype.normalize = function() {
    return this.scale( 1 / this.norm() );
};

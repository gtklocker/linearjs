Array.prototype.zip = function( fn, array ) {
    var ret = [];
    for ( var i = 0; i < this.length; ++i ) {
        ret.push( fn( this[ i ], array[ i ] ) );
    }

    return ret;
};

Array.cons = function( head, tail ) {
    b = [ head ];
    b.push.apply( b, tail );
    return b;
};

Array.head = function( array ) {
    return array[ 0 ];
};

Array.tail = function( array ) {
    var ret = [];
    for ( var i = 1; i < array.length; ++i ) {
        ret.push( array[ i ] );
    }

    return ret;
};

Array.prototype.head = function() {
    return Array.head( this );
};

Array.prototype.tail = function() {
    return Array.tail( this );
};

Array.prototype.sum = function() {
    return this.reduce( function( total, x ) {
        return total + x;
    }, 0 );
};

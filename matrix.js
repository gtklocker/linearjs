function Matrix( matrix ) {
    this.matrix = matrix;

    // matrix dimensions: nxm
    this.n = this.matrix.length;
    this.m = this.matrix[ 0 ].length;
}

Matrix.prototype.array = function() {
    return this.matrix;
};

Matrix.prototype.scale = function( lambda ) {
    var A = this.array();

    return new Matrix(
        A.map( function( row ) {
            row.map( function( x ) {
                return lambda * x;
            } );
        } )
    );
}

Matrix.prototype.clone = function() {
    return this.scale( 1 );
};

Matrix.prototype.negate = function() {
    return this.scale( -1 );
};

Matrix.prototype.add = function( matrix ) {
    var A = this.array(),
        B = matrix.array();

    return new Matrix(
        A.zip( function( rowA, rowB ) {
            var vecA = new Vector( rowA ),
                vecB = new Vector( rowB );

            return vecA.add( vecB ).array();
        }, B )
    );
};

Matrix.prototype.subtract = function( matrix ) {
    return this.add( matrix.negate() );
};

Matrix.prototype.transpose = function() {
    var A = this.array();

    function transpose( array ) {
        // nothing left to transpose
        if ( array[ 0 ].length === 0 ) {
            return [];
        }
        return Array.cons(
            array.map( Array.head ),
            transpose( array.map( Array.tail ) )
        );
    }
    return new Matrix(
        transpose( A )
    );
};

Matrix.prototype.multiply = function( matrix ) {
    var A  = this.array(),
        B  = matrix.array(),
        Bt = matrix.transpose().array();

    return new Matrix(
        A.map( function( row ) {
            return Bt.map( function( col ) {
                return new Vector( row ).dot( new Vector( col ) );
            } );
        } )
    );
};

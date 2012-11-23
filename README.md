LinearJS
========

About
-----
LinearJS is a library I started writing to use with some WebGL
applications I made. It allows you to do operations (mentioned below) on vectors
and matrices, no matter what their dimensions are. It has a pretty clean API
that is inspired by Sylvester and it just gets the job done.

Supported operations
--------------------
For vectors:

 * addition
 * subtraction
 * scaling
 * dot product
 * cross product (for 3d vectors only)
 * normalization

For matrices:

 * addition
 * subtraction
 * transpose
 * multiplication

Keep in mind that those operations are supposed to work for whatever dimensions
you like.

How to use
----------
In order to use LinearJS, you have to include the
following files in your project, in the exact order:

 * array.js
 * vector.js
 * matrix.js

matrix.js depends on vector.js, which both depend on array.js... you get it.

Now, some examples. First go matrices.

    var a = new Matrix( [ [ 1 ], [ 2 ], [ 3 ] ]);
    a = a.multiply( Matrix.rotateX( Math.PI / 6 ) );

And vectors.

    var v = new Vector( [ 1, 2 ] );
    v = v.add( new Vector( [ 3, 4 ] );

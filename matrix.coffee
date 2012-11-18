class Matrix
    constructor: ( @matA ) ->

    neg: () ->
        @matA.map ( row ) -> row.map ( each ) -> -each

    add: ( matB ) ->
        @matA.zip ( ( rowA, rowB ) -> Vector( rowA ).add( Vector( rowB ) ) ), matB

    sub: ( matB ) ->
        @add a, ( neg b )

    transpose: () ->
        if @matA[ 0 ].length < 1
            []
        else
            Array.cons ( @matA.map head ), ( transpose ( @matA.map tail ) )

    mul: ( matB ) ->
        @matA.map ( row ) ->
            transpose( matB ).map ( col ) ->
                dot row, col

# Sylvester-inspired shortcut for Matrix factory
$M = ( matrix ) -> new Matrix matrix

sin = Math.sin
cos = Math.cos

Matrix.rotateY = ( theta ) ->
    $M( [
        [  cos( theta ), 0, sin( theta ) ],
        [  0           , 1, 0            ],
        [ -sin( theta ), 0, cos( theta ) ]
    ] )

Matrix.rotateX = ( theta ) ->
    $M( [
        [ 1, 0,             0            ],
        [ 0, cos( theta ), -sin( theta ) ],
        [ 0, sin( theta ),  cos( theta ) ]
    ] )

window.Matrix = Matrix
window.$M = $M

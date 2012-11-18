# Sylvester-inspired shortcut for Matrix factory
$M = ( matrix ) -> new Matrix matrix

class Matrix
    constructor: ( @mat ) ->

    neg: () ->
        $M( @mat.map ( row ) -> row.map ( each ) -> -each )

    add: ( matB ) ->
        $M( @mat.zip ( ( rowA, rowB ) -> Vector( rowA ).add( Vector( rowB ) ) ), matB.mat )

    sub: ( matB ) ->
        $M( @add @mat, matB.neg() )

    transpose: () ->
        if @mat[ 0 ].length < 1
            $M( [] )
        else
            $M( Array.cons $M( @mat.map Array.head ).mat, $M( @mat.map Array.tail ).transpose().mat )

    mul: ( matB ) ->
        $M( @mat.map ( row ) ->
                matB.transpose().mat.map ( col ) ->
                    $V( row ).dot $V( col ) )


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

$M.rotateY = ( theta ) -> Matrix.rotateY theta
$M.rotateX = ( theta ) -> Matrix.rotateX theta

window.Matrix = Matrix
window.$M = $M

vectorAdd = ( a, b )->
    a.zip ( ( x, y ) -> x + y ), b

dot = ( a, b ) ->
    ( a.zip ( ( x, y ) -> x * y ), b ).sum()

neg = ( a ) ->
    a.map ( row ) -> row.map ( each ) -> each *= -1

add = ( a, b ) ->
    a.zip ( ( rowA, rowB ) -> vectorAdd rowA, rowB ), b

sub = ( a, b ) ->
    add a, ( neg b )

transpose = ( a ) ->
    if a[ 0 ].length < 1
        []
    else
        Array.cons ( a.map head ), ( transpose ( a.map tail ) )

mul = ( a, b ) ->
    a.map ( row ) ->
        transpose( b ).map ( col ) ->
            dot row, col

sin = Math.sin
cos = Math.cos

rotateY = ( theta ) ->
    [
        [  cos( theta ), 0, sin( theta ) ],
        [  0           , 1, 0            ],
        [ -sin( theta ), 0, cos( theta ) ]
    ]

rotateX = ( theta ) ->
    [
        [ 1, 0,             0            ],
        [ 0, cos( theta ), -sin( theta ) ],
        [ 0, sin( theta ),  cos( theta ) ]
    ]

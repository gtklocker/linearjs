class Vector
    constructor: ( @v ) ->

    add: ( u ) ->
        @v.zip ( ( x, y ) -> x + y ), u

    dot: ( u ) ->
        ( @v.zip ( ( x, y ) -> x * y ), u ).sum()

window.Vector = Vector;

# Sylvester-inspired shortcut for Vector factory
$V = ( vector ) -> new Vector vector
class Vector
    constructor: ( @v ) ->

    add: ( u ) ->
        @v.zip ( ( x, y ) -> x + y ), u.v

    dot: ( u ) ->
        ( @v.zip ( ( x, y ) -> x * y ), u.v ).sum()

window.Vector = Vector
window.$V = $V

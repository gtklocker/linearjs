Array::zip = ( fn, a ) ->
    fn( this[ i ], a[ i ] ) for i in [ 0...this.length ]

Array::sum = () -> this.reduce ( ( total, elem ) -> total + elem ), 0

Array.head = () -> this[ 0 ]
Array.tail = () -> this[ 1.. ]

head = ( a ) -> a.head()
tail = ( a ) -> a.tail()

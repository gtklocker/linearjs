CC=coffee
CFLAGS=-c

all: proto.js vector.js matrix.js

proto.js:
	$(CC) $(CFLAGS) proto.coffee

vector.js:
	$(CC) $(CFLAGS) vector.coffee

matrix.js:
	$(CC) $(CFLAGS) matrix.coffee

clean:
	rm -f proto.js vector.js matrix.js

CC=coffee
CFLAGS=-c

all: proto.js matrix.js

proto.js:
	$(CC) $(CFLAGS) proto.coffee

matrix.js:
	$(CC) $(CFLAGS) matrix.coffee

clean:
	rm proto.js matrix.js

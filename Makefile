LIBS = -L/usr/local/lib -lpcap

all: libsess3.so libdemo.so uselib tryshared useDemo

libsess3.so: sess3.c sess3.h
	gcc -c -Wall -Werror -fpic sess3.c
	gcc -shared -o libsess3.so sess3.o

libdemo.so: demo.c demo.h
	gcc -c -Wall -Werror -fpic demo.c
	gcc -shared -o libdemo.so demo.o

uselib: uselib.c libsess3.so
	gcc -L$(PWD) uselib.c -o uselib -lsess3

tryshared: tryshared.c libsess3.so
	gcc -L$(PWD) tryshared.c -o tryshared -lsess3

useDemo: useDemo.c libdemo.so
	gcc -L$(PWD) useDemo.c -o useDemo -ldemo

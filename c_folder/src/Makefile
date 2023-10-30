CC=gcc 
CFLAGS=-Wall -Wextra -Werror 
EXECUTABLE=./hist

all: histogram

histogram: 
	$(CC) $(CFLAGS) ./hist.c -o $(EXECUTABLE)

clean: 
	rm -rf ./hist ./file.txt

rebuild:clean all
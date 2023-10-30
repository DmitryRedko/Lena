#include <stdio.h>
#include <getopt.h>


int main(int argc, char *argv[]) {
    int opt;
    int option_index = 0;

    // Опции, которые программа поддерживает
    // ТОЛЬКО ДЛЯ ДЛИННЫХ ИМЕН
    static struct option long_options[] = {
        {"number-nonblank", no_argument, 0, 'b'},
        {"number", no_argument, 0, 'n'},
        {"squeeze-blank", no_argument, 0, 's'},
        {0, 0, 0, 0}
    };


    return 0;
}

#include <stdio.h>
#include <getopt.h>


int main(int argc, char *argv[]) {
    int opt;
    int option_index = 0;

    // Опции, которые программа поддерживает
    // ТОЛЬКО ДЛЯ ДЛИННЫХ ИМЕН
    static struct option long_options[] = {
        {"help", no_argument, 0, 'h'},
        {"input", required_argument, 0, 'i'},
        {"output", required_argument, 0, 'o'},
        {0, 0, 0, 0}
    };

    while ((opt = getopt_long(argc, argv, "nbvhi:o:", long_options, &option_index)) != -1) {
        switch (opt) {
            case 'h':
                printf("Помощь: Вызов справки\n");
                break;

            case 'i':
                printf("Опция -i с аргументом: %s\n", optarg);
                break;

            case 'o':
                printf("Опция -o с аргументом: %s\n", optarg);
                break;

            case '?':
                // Некорректная опция или отсутствие аргумента
                break;

            default:
                // Другие сценарии обработки
                break;
        }
    }

    // Обработка позиционных аргументов
    for (int i = optind; i < argc; i++) {
        printf("Позиционный аргумент: %s\n", argv[i]);
    }

    return 0;
}

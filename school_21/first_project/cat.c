#include <stdio.h>
#include <string.h>

void cat(char *filename);

int main(int argc, char **argv) {

    // printf("argc %d\n", argc);

    // for (int i = 0; i < argc; i++) {
    //     printf("argv[%d] %s\n", i, argv[i]);
    // }
    
    // printf("\n");

    if (argc == 2) {
        char filename[100];
        strncpy(filename, argv[1], 99); 
        filename[99] = '\0'; 
        // printf("%s\n", filename);
        
        cat(filename);
    } 

    return 0;
}

void cat(char *filename) {
    int flag = 1;
    char buffer[256];

    FILE *fp = fopen(filename, "r");
    
    if (fp) {
        while ((fgets(buffer, 256, fp)) != NULL) {
            printf("%s", buffer);
            flag = 0;
        }
        if (flag) {
            printf("n/a");
        }
        fclose(fp);
        printf("\n");
    } else {
        printf("n/a\n");
    }
}


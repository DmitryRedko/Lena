#include <stdio.h>
#include <stdlib.h>

void hist(float rangeMin, float rangeMax, int nBins, float* v, int lenV, int* counts);
void writeResultsToFile(const char *filename, int nBins, int* counts);

int main(int argc, char *argv[]) {
    float rangeMin = -6;
    float rangeMax = 6;
    int nBins = 6;
    int counts[nBins];

    for(int i = 0; i < nBins; i++) {
        counts[i] = 0;
    }

    int lenV = argc - 1;
    float v[lenV];

    for (int i = 0; i < argc; i++) {
        v[i - 1] = strtof(argv[i], NULL);
    }

    hist(rangeMin, rangeMax, nBins, v, lenV, counts);

    for (int i = 0; i < nBins; i++) {
        printf("bin[%d] - %d\n", i + 1, counts[i]);
    }

    writeResultsToFile("file.txt", nBins, counts);

    return 0;
}

void hist(float rangeMin, float rangeMax, int nBins, float* v, int lenV, int* counts) {
    float h = (rangeMax - rangeMin) / nBins;
    
    for (int i = 0; i < nBins; i++) {
        for (int j = 0; j < lenV; j++) {
            if (v[j] >= (rangeMin + h * i) && v[j] < (rangeMin + h * (i + 1))) {
                counts[i]++;
            } 
        }
    }

    for (int j = 0; j < lenV; j++) {
        if (v[j] == rangeMax) {
            counts[nBins - 1]++;
        } 
    }
}

void writeResultsToFile(const char *filename, int nBins, int* counts) {
    FILE *file = fopen(filename, "w");
    if (file == NULL) {
        printf("Could not open the file\n");
        return;
    }

    for (int i = 0; i < nBins; i++) {
        fprintf(file, "In the %d interval - %d values\n", i + 1, counts[i]);
    }

    fclose(file);
}

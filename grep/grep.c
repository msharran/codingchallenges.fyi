#include <stdio.h>
#include <stdlib.h>
#include <string.h>


void help(char *argv[]) {
	fprintf(stderr, "Usage: %s <pattern> <file>\n", argv[0]);
}

int main(int argc, char *argv[]) {
	if (argc != 3) {
		help(argv);
		return 1;
	}

	FILE *fp = fopen(argv[2], "r");
	if (fp == NULL) {
		perror("fopen");
		return 1;
	}

	char *line = NULL;
	size_t linecap = 0;
	ssize_t linelen;
	while ((linelen = getline(&line, &linecap, fp)) > 0) {
		if (strstr(line, argv[1]) != NULL) {
			fwrite(line, linelen, 1, stdout);
		}
	}

	return 0;
}

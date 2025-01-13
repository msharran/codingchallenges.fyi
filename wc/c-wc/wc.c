#include <stdbool.h>
#include <stdio.h>
#include <string.h>

// line -- foo bar    bax hello \n
int print_count(FILE *f, char *flag, char *fname) {
  int wc = 0, lc = 0, cc = 0;
  char c;
  int wordCharCount = 0;

  while ((c = fgetc(f)) != EOF) {
    cc++;
    if (c == '\n') {
      lc++;
    }

    if (c == ' ' || c == '\t' || c == '\0' || c == '\n') {
      if (wordCharCount > 0) // prev char is not a empty space
        wc++;
      wordCharCount = 0;
    } else {
      wordCharCount++;
    }
  }

  if (flag == NULL) {
    printf("      %d      %d      %d ", lc, wc, cc);
  } else if (strcmp(flag, "-c") == 0) {
    printf("      %d ", cc);
  } else if (strcmp(flag, "-l") == 0) {
    printf("      %d ", lc);
  } else if (strcmp(flag, "-w") == 0) {
    printf("      %d ", wc);
  } else {
    fprintf(stderr, "wc: invalid options, should be one of [-clw]\n");
    return 1;
  }
  if (fname != NULL)
    printf("%s", fname);
  printf("\n");
  return 0;
}


int main(int argc, char *argv[]) {
  char *flag;
  FILE *f = stdin;
  char *fname;

  if (argc >= 3) { // file with flags
    // for now handle one file
    fname = argv[2];
    f = fopen(fname, "r");
    flag = argv[1];
  } else if (argc == 2) { // stdin with flags
    flag = argv[1];
  }

  if (f == NULL) {
    perror("fopen");
    return 1;
  }

  int retval = print_count(f, flag, fname);
  fclose(f);
  return retval;
}

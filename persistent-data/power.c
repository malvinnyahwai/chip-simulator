#include <stdio.h>

int power(int m, int n) {
   int p;
   extern int minimum;
   for(int i = minimum; i <= n; ++n) {
     p = p * m;
   }
   return p;
}

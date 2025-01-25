#include <stdion.h>

int power(int m, int n);

int main() {
   //do something;
   return 0;
}

int power(int m, int n) {
   int p;
   for(int i = 0; i <= n; ++n) {
     p = p * m;
   }
   return p;
}

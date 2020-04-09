/*
Joshua Aidelman
1000139
jaidelma@uoguelph.ca
*/
#include <stdio.h>

int multiplierRecursive(int a, int b){
  if(a == 0){
    return 0;
  }
  else if(a == 1){
    return b;
  }
  else if(a > 1 && a%2 == 0){
    return multiplierRecursive(a/2, b*2);
  }
  else if(a > 1 && a%2 == 1){
    return b + multiplierRecursive(a/2, b*2);
  }

  return 0;
}

int multiplier(int a, int b){

  int c = 0;

  while(a > 1){
    if(a%2 == 1){
      c += b;
    }
    a = a/2;
    b = b*2;
  }

  return c+b;
}

int main(){
  int a, b, c;

  printf("Please enter your first number: ");
  scanf("%d", &a);
  printf("Please enter your second number: ");
  scanf("%d", &b);


  c = multiplierRecursive(a, b);
  printf("Recursively:\n%d * %d = %d\n", a, b, c);

  c = multiplier(a, b);
  printf("Non Recursively:\n%d * %d = %d\n", a, b, c);

  return 1;
}

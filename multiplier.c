/* Joshua Aidelman
  1000139
  jaidelma@uoguelph.ca

  This program applies the Russian Peasant Multiplication algorithm
  in C, both recursively and non recursively. */

#include <stdio.h>
#include <time.h>
/* This function applies the algorithm resursively */
long multiplierRecursive(long a, long b){
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

/* This function applies the algorithm non resursively */
long multiplier(long a, long b){

  long c = 0;

  while(a > 1){
    if(a%2 == 1){
      c += b;
    }
    a = a/2;
    b = b*2;
  }

  return c+b;
}

/* Main function to run algorithm and get input */
int main(){
  long a, b, c; //To store values
  double time_spent; //To store time
  clock_t begin, end; //For timing

  //Get input from user
  printf("Please enter your first number: ");
  scanf("%ld", &a);
  printf("Please enter your second number: ");
  scanf("%ld", &b);

  //Call recursive function, time and print result
  begin = clock();
  c = multiplierRecursive(a, b);
  end = clock();
  time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
  printf("Recursively:%ld * %ld = %ld\nTime elapsed: %.10lf seconds\n", a, b, c, time_spent);

  //Call non-recursive function, time and print result
  begin = clock();
  c = multiplierRecursive(a, b);
  end = clock();
  time_spent = (double)(end - begin) / CLOCKS_PER_SEC;
  printf("Non Recursively:%ld * %ld = %ld\nTime elapsed: %.10lf seconds\n", a, b, c, time_spent);

  return 1;
}

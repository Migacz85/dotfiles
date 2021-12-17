#include <stdio.h>

int main()
{

/* //make pairs of this array */
/* int boxes[4]={4, 5, 2, 56}; */
/* for (int i=0; i<sizeof boxes[0]; i++ ) { */
/*     for (int j=0; j<sizeof boxes[0]; j++ ) { */ 
/*     printf("%d", boxes[i]); */
/*     printf( "%d ", boxes[j]); */
/*     } */
/* } */

    //return true/false when there is same value in each array
/* int boxes[4]={4, 5, 2, 56}; */ 
/* int boxes2[4]={4, 5, 2, 56}; */ 

int boxes[4]={1, 3, 4, 5}; 
int boxes2[4]={6,9, 7, 5}; 

int result=0;

for (int i=0; i<sizeof boxes[0]; i++) {
    
      for (int j=0; j<sizeof boxes[0]; j++) {
          if (boxes[i]==boxes2[j]){ 
            printf("%d", boxes[j]); 
              result=1;
          }
      }
}

printf("%d", result); 
return 0;

}


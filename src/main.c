#include <stdio.h>
#include <stdlib.h>

#include "types.h"

int main(){
    
    u8 choice;

    printf("Choose a version:\n");
    printf("\t[1] - Ubuntu 22.04\n");
    printf("\t[2] - Ubuntu 20.04\n");
    printf("==> ");
    scanf("%c", &choice);

    switch(choice){
        case '1':
            printf("\nUbuntu 22.04\n");
            break;
        case '2':
            printf("\nUbuntu 20.04\n");
            break;
        default:
            printf("Invalid choice\n");
            break;
    }

    return 0;
}
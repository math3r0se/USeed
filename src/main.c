#ifdef _WIN32
#define OS_WINDOWS
#define OS_EXTENSION ".exe"
#elif defined(__linux__)
#define OS_LINUX
#define OS_EXTENSION ""
#elif defined(__APPLE__)
#define OS_MACOS
#define OS_EXTENSION ""
#else
#error "Unknown OS"
#endif

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
#include <curl/curl.h>
#include <stdio.h>
#include <stdlib.h>

#include "types.h"

int main(){
    
    u8 choice;
    u8 path[] = "/tmp/";

    printf("Choose a version:\n");
    printf("\t[1] - Ubuntu 22.04\n");
    printf("\t[2] - Ubuntu 20.04\n");
    printf("==> ");
    scanf("%c", &choice);

    switch(choice){
        case '1':
            download_iso(2204);
            break;
        case '2':
            download_iso(2004);
            break;
        default:
            printf("Invalid choice\n");
            break;
    }

    return 0;
}

int download_iso(version) {
    CURL *curl = curl_easy_init();
    u8 url[];
    
    if(!curl){
        printf("Error: curl_easy_init()\n");
        return 1;
    }

    if (version == 2204) {
        url = "https://mirror.steadfastnet.com/ubuntu-releases/22.04/ubuntu-22.04-desktop-amd64.iso";
    } else if (version == 2004) {
        url = "https://mirror.steadfastnet.com/ubuntu-releases/20.04/ubuntu-20.04.4-desktop-amd64.iso";
    } else {
        printf("Invalid version\n");
        return 1;
    }

    curl_easy_setopt(curl, CURLOPT_URL, $URL)
    
    CURLcode result = curl_easy_perform(curl);
    if(result != CURLE_OK){
        printf("Error: curl_easy_perform()\n");
        return 1;
    }

    curl_easy_cleanup(curl);
    return 0;
}
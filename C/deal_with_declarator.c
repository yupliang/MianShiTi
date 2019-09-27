#include <stdio.h>
#include <ctype.h>

#define MAXTOKENLEN 64

struct token {
    char type;
    char string[MAXTOKENLEN];
};

struct token this;//保存刚读入的那个标记

void classify_string() {
    
}
void gettoken() {//读取下一个标记
    char *p = this.string;
    while ((*p=getchar())==' ') {
        ;
    }
    printf("- input is %c ---- is (a-z,0-9) %d\n", *p,isalnum(*p));
    if (isalnum(*p)) {//a-z,0-9
        getchar();
        *++p = getchar();
        printf("二 input is %c ---- is (a-z,0-9) %d\n", *p,isalnum(*p));
        while (isalnum(*p)) {
            getchar();
            *++p = getchar();
        }
    }
    //如果是字母数字组合，调用classify_string
}
void read_to_first_identifier() {
    gettoken();
}
int main() {
    printf("use this program to deal with declarator:\n");
    //将标记压入栈中，直到遇见标识符
    read_to_first_identifier();
    return 0;
}

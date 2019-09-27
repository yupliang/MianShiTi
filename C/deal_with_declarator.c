#include <stdio.h>
#include <ctype.h>
#include <string.h>

#define MAXTOKENLEN 64
#define STRCMP(a,R,b) (strcmp(a,b) R 0)

struct token {
    char type;
    char string[MAXTOKENLEN];
};

enum type_tag {
    IDENTIFIER,
    QUALIFIER,
    TYPE
};

struct token this;//保存刚读入的那个标记

enum type_tag classify_string() {
//    printf("INPUT STRING IS %s\n", this.string);
    char *s = this.string;
    if (STRCMP(s,==,"const")) {
        return QUALIFIER;
    }
    if (STRCMP(s,==,"int")) {
        return TYPE;
    }
    return IDENTIFIER;
}
void gettoken() {//读取下一个标记
    char *p = this.string;
    while ((*p=getchar())==' ') {
        ;
    }
    if (isalnum(*p)) {//a-z,0-9
        while (isalnum(*++p = getchar())) {
            ;
        }
//        printf("- input is %s\n", p);
        ungetc(*p, stdin);
        *p = '\0';
        this.type = classify_string();
        return;
    }
    //如果是字母数字组合，调用classify_string
}
void read_to_first_identifier() {
    gettoken();
//    while (this.type != IDENTIFIER) {
//
//    }
    printf("%s is ", this.string);
    gettoken();
}
int main() {
    printf("use this program to deal with declarator:\n");
    //将标记压入栈中，直到遇见标识符
    read_to_first_identifier();
    printf("\n");
    return 0;
}

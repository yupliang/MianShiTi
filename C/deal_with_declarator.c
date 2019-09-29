#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>

#define MAXTOKENLEN 64
#define MAXTOKENS 100
#define STRCMP(a,R,b) (strcmp(a,b) R 0)
#define push(s) stack[++top] = s
#define pop stack[top--]

struct token {
    char type;
    char string[MAXTOKENLEN];
};

enum type_tag {
    IDENTIFIER,
    QUALIFIER,
    TYPE
};

struct token stack[MAXTOKENS];
struct token this;//保存刚读入的那个标记

int top = -1;

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
//    printf("gettoken begin %s", this.string);
    while ((*p=getchar())==' ') {
        ;
    }
    if (isalnum(*p)) {//a-z,0-9 如果是字母数字组合，调用classify_string
        while (isalnum(*++p = getchar())) {
            ;
        }
//        printf("- input is %s\n", p);
        ungetc(*p, stdin);
        *p = '\0';
        this.type = classify_string();
        return;
    }
    if (*p == '*') {
//        printf("拷贝前 %s", this.string);
        strcpy(this.string, "point to(指向)");
        this.type = '*';
        return;
//        printf("拷贝后 %s", this.string);
    }
    this.string[1] = '\0';
    this.type = *p;
}
void read_to_first_identifier() {
    gettoken();
    while (this.type != IDENTIFIER) {
        push(this);
        gettoken();
    }
    printf("%s is ", this.string);
    gettoken();
}

void deal_with_pointers() {
    while (stack[top].type == '*') {
        printf("%s ", pop.string);
    }
}

void deal_with_arrays() {
//    printf("deal with array begin");
    while (this.type == '[') {
        printf("array ");
        gettoken();/*数字或]*/
        if (isdigit(this.string[0])) {
            printf("0..%d ", atoi(this.string)-1);
            gettoken();//读取']'
        }
        gettoken();
        printf("of ");
    }
}

void deal_with_func_args() {
    gettoken();
    printf("function returning ");
}

void deal_with_declarator() {//处理声明器
    /*处理标识符之后可能存在数组*/
    switch (this.type) {
        case '[':
            deal_with_arrays();
            break;
        case '(':
            deal_with_func_args();
            break;
        default:
            break;
    }
    deal_with_pointers();
    while (top >= 0) {
        if (stack[top].type == '(') {
            pop;
            gettoken();
            deal_with_declarator();
        } else {
            printf("%s ", pop.string);
        }
    }
}

int main() {
    printf("use this program to deal with declarator:\n");
    //将标记压入栈中，直到遇见标识符
    read_to_first_identifier();
    deal_with_declarator();
    printf("\n");
    return 0;
}

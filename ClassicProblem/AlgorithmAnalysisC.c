//
//  AlgorithmAnalysisC.c
//  MianshiTi
//
//  Created by Qiqiuzhe on 2019/10/20.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//

#include "AlgorithmAnalysisC.h"

double Eval(int N) {
    double Sum;
    double *C;
    C = (double *)malloc(sizeof(double)*(N+1));
    if (C == NULL) {
        printf("Out of space!!");
    }
    C[0] = 1;
    
    for (int i=1; i<=N; i++) {
        Sum = 0;
        for (int j=0; j<i; j++) {
            Sum += C[j];
        }
        C[i] = 2*Sum/i+i;
    }
    free(C);
    return C[N];
}

//double Eval(int N) {
//    double Answer,Sum;
////    double *C;
////    C[0] = 1;
//    if (N == 0) {
//        return 1;
//    }
//    Sum = 0;
//    for (int i=0; i<N; i++) {
//        Sum += Eval(i);
//    }
//    return 2*Sum/N+N;
//}

//
//  Example.s
//  MianshiTi
//
//  Created by yupeiliang on 2019/7/11.
//  Copyright © 2019 QiQiuZhe. All rights reserved.
//
;Example.s
.section __TEXT,__text,regular,pure_instructions
.ios_version_min 11,2
.p2align 2
.global _double_num_times_asm
_double_num_times_asm:
    lsl x0,x0,x1
    ret

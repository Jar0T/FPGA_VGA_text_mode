/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0xfbc00daa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/jaroslaw/developement/FPGA/projects/VGA_text/UART.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

char *ieee_p_1242562249_sub_1006216973935652998_1035706684(char *, char *, char *, char *, int );
unsigned char ieee_p_1242562249_sub_3307759752501503797_1035706684(char *, char *, char *, int );
unsigned char ieee_p_2592010699_sub_13554554585326073636_503743352(char *, char *, unsigned int , unsigned int );
unsigned char ieee_p_2592010699_sub_374109322130769762_503743352(char *, unsigned char );


static void work_a_2239630122_3212880686_p_0(char *t0)
{
    char t13[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t14;
    unsigned int t15;

LAB0:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 4992);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(89, ng0);
    t3 = (t0 + 2312U);
    t4 = *((char **)t3);
    t3 = (t0 + 8312U);
    t5 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t4, t3, 64);
    if (t5 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 2312U);
    t3 = *((char **)t1);
    t1 = (t0 + 8312U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t13, t3, t1, 1);
    t6 = (t13 + 12U);
    t14 = *((unsigned int *)t6);
    t15 = (1U * t14);
    t2 = (7U != t15);
    if (t2 == 1)
        goto LAB8;

LAB9:    t7 = (t0 + 5088);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t4, 7U);
    xsi_driver_first_trans_fast(t7);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(90, ng0);
    t6 = (t0 + 8430);
    t8 = (t0 + 5088);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    memcpy(t12, t6, 7U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 2472U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t5 = ieee_p_2592010699_sub_374109322130769762_503743352(IEEE_P_2592010699, t2);
    t1 = (t0 + 5152);
    t4 = (t1 + 56U);
    t6 = *((char **)t4);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = t5;
    xsi_driver_first_trans_fast(t1);
    goto LAB6;

LAB8:    xsi_size_not_matching(7U, t15, 0);
    goto LAB9;

}

static void work_a_2239630122_3212880686_p_1(char *t0)
{
    char t20[16];
    char t24[16];
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t18;
    unsigned char t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t25;

LAB0:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 2432U);
    t2 = ieee_p_2592010699_sub_13554554585326073636_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5008);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(101, ng0);
    t3 = (t0 + 2632U);
    t4 = *((char **)t3);
    t3 = (t0 + 8437);
    t6 = xsi_mem_cmp(t3, t4, 2U);
    if (t6 == 1)
        goto LAB6;

LAB10:    t7 = (t0 + 8439);
    t9 = xsi_mem_cmp(t7, t4, 2U);
    if (t9 == 1)
        goto LAB7;

LAB11:    t10 = (t0 + 8441);
    t12 = xsi_mem_cmp(t10, t4, 2U);
    if (t12 == 1)
        goto LAB8;

LAB12:
LAB9:    xsi_set_current_line(139, ng0);
    t1 = (t0 + 8468);
    t4 = (t0 + 5344);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);

LAB5:    goto LAB3;

LAB6:    xsi_set_current_line(103, ng0);
    t13 = (t0 + 5216);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    *((unsigned char *)t17) = (unsigned char)2;
    xsi_driver_first_trans_fast(t13);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 1352U);
    t3 = *((char **)t1);
    t2 = *((unsigned char *)t3);
    t18 = (t2 == (unsigned char)2);
    if (t18 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 8449);
    t4 = (t0 + 5280);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast(t4);

LAB15:    goto LAB5;

LAB7:    xsi_set_current_line(116, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 8360U);
    t2 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t3, t1, 15);
    if (t2 != 0)
        goto LAB22;

LAB24:    xsi_set_current_line(127, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 8360U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t20, t3, t1, 1);
    t5 = (t20 + 12U);
    t21 = *((unsigned int *)t5);
    t22 = (1U * t21);
    t2 = (4U != t22);
    if (t2 == 1)
        goto LAB32;

LAB33:    t7 = (t0 + 5280);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);

LAB23:    goto LAB5;

LAB8:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 8360U);
    t2 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t3, t1, 15);
    if (t2 != 0)
        goto LAB34;

LAB36:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 8360U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t20, t3, t1, 1);
    t5 = (t20 + 12U);
    t21 = *((unsigned int *)t5);
    t22 = (1U * t21);
    t2 = (4U != t22);
    if (t2 == 1)
        goto LAB37;

LAB38:    t7 = (t0 + 5280);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);

LAB35:    goto LAB5;

LAB13:;
LAB14:    xsi_set_current_line(105, ng0);
    t1 = (t0 + 2952U);
    t4 = *((char **)t1);
    t1 = (t0 + 8360U);
    t19 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t4, t1, 7);
    if (t19 != 0)
        goto LAB17;

LAB19:    xsi_set_current_line(109, ng0);
    t1 = (t0 + 2952U);
    t3 = *((char **)t1);
    t1 = (t0 + 8360U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t20, t3, t1, 1);
    t5 = (t20 + 12U);
    t21 = *((unsigned int *)t5);
    t22 = (1U * t21);
    t2 = (4U != t22);
    if (t2 == 1)
        goto LAB20;

LAB21:    t7 = (t0 + 5280);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);

LAB18:    goto LAB15;

LAB17:    xsi_set_current_line(106, ng0);
    t5 = (t0 + 8443);
    t8 = (t0 + 5280);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t13 = (t11 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t5, 4U);
    xsi_driver_first_trans_fast(t8);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 8447);
    t4 = (t0 + 5344);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    goto LAB18;

LAB20:    xsi_size_not_matching(4U, t22, 0);
    goto LAB21;

LAB22:    xsi_set_current_line(117, ng0);
    t4 = (t0 + 8453);
    t7 = (t0 + 5280);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 2792U);
    t3 = *((char **)t1);
    t21 = (7 - 6);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t1 = (t3 + t23);
    t4 = (t0 + 1352U);
    t5 = *((char **)t4);
    t2 = *((unsigned char *)t5);
    t7 = ((IEEE_P_2592010699) + 4000);
    t8 = (t24 + 0U);
    t10 = (t8 + 0U);
    *((int *)t10) = 6;
    t10 = (t8 + 4U);
    *((int *)t10) = 0;
    t10 = (t8 + 8U);
    *((int *)t10) = -1;
    t6 = (0 - 6);
    t25 = (t6 * -1);
    t25 = (t25 + 1);
    t10 = (t8 + 12U);
    *((unsigned int *)t10) = t25;
    t4 = xsi_base_array_concat(t4, t20, t7, (char)97, t1, t24, (char)99, t2, (char)101);
    t25 = (7U + 1U);
    t18 = (8U != t25);
    if (t18 == 1)
        goto LAB25;

LAB26:    t10 = (t0 + 5408);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t4, 8U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(120, ng0);
    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t1 = (t0 + 8376U);
    t2 = ieee_p_1242562249_sub_3307759752501503797_1035706684(IEEE_P_1242562249, t3, t1, 7);
    if (t2 != 0)
        goto LAB27;

LAB29:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 3112U);
    t3 = *((char **)t1);
    t1 = (t0 + 8376U);
    t4 = ieee_p_1242562249_sub_1006216973935652998_1035706684(IEEE_P_1242562249, t20, t3, t1, 1);
    t5 = (t20 + 12U);
    t21 = *((unsigned int *)t5);
    t22 = (1U * t21);
    t2 = (3U != t22);
    if (t2 == 1)
        goto LAB30;

LAB31:    t7 = (t0 + 5472);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 3U);
    xsi_driver_first_trans_fast(t7);

LAB28:    goto LAB23;

LAB25:    xsi_size_not_matching(8U, t25, 0);
    goto LAB26;

LAB27:    xsi_set_current_line(121, ng0);
    t4 = (t0 + 8457);
    t7 = (t0 + 5344);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 2U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 8459);
    t4 = (t0 + 5472);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 3U);
    xsi_driver_first_trans_fast(t4);
    goto LAB28;

LAB30:    xsi_size_not_matching(3U, t22, 0);
    goto LAB31;

LAB32:    xsi_size_not_matching(4U, t22, 0);
    goto LAB33;

LAB34:    xsi_set_current_line(132, ng0);
    t4 = (t0 + 8462);
    t7 = (t0 + 5280);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    t11 = (t10 + 56U);
    t13 = *((char **)t11);
    memcpy(t13, t4, 4U);
    xsi_driver_first_trans_fast(t7);
    xsi_set_current_line(133, ng0);
    t1 = (t0 + 8466);
    t4 = (t0 + 5344);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    t8 = (t7 + 56U);
    t10 = *((char **)t8);
    memcpy(t10, t1, 2U);
    xsi_driver_first_trans_fast(t4);
    xsi_set_current_line(134, ng0);
    t1 = (t0 + 5216);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t7 = *((char **)t5);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast(t1);
    goto LAB35;

LAB37:    xsi_size_not_matching(4U, t22, 0);
    goto LAB38;

}


extern void work_a_2239630122_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2239630122_3212880686_p_0,(void *)work_a_2239630122_3212880686_p_1};
	xsi_register_didat("work_a_2239630122_3212880686", "isim/UART_TB_isim_beh.exe.sim/work/a_2239630122_3212880686.didat");
	xsi_register_executes(pe);
}

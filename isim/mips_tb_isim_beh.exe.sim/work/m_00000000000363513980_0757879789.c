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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/.Xilinx/xilinx/P6/NPC.v";
static unsigned int ng1[] = {0U, 0U};
static int ng2[] = {14, 0};
static int ng3[] = {4, 0};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {2U, 0U};
static unsigned int ng6[] = {3U, 0U};



static void Always_32_0(char *t0)
{
    char t7[8];
    char t46[8];
    char t47[8];
    char t57[8];
    char t61[8];
    char t69[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    int t30;
    int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    char *t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    char *t44;
    char *t45;
    char *t48;
    char *t49;
    char *t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t58;
    char *t59;
    char *t60;
    char *t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t70;

LAB0:    t1 = (t0 + 3488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(32, ng0);
    t2 = (t0 + 4056);
    *((int *)t2) = 1;
    t3 = (t0 + 3520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 1688U);
    t5 = *((char **)t4);
    t4 = (t0 + 1848U);
    t6 = *((char **)t4);
    t8 = *((unsigned int *)t5);
    t9 = *((unsigned int *)t6);
    t10 = (t8 & t9);
    *((unsigned int *)t7) = t10;
    t4 = (t5 + 4);
    t11 = (t6 + 4);
    t12 = (t7 + 4);
    t13 = *((unsigned int *)t4);
    t14 = *((unsigned int *)t11);
    t15 = (t13 | t14);
    *((unsigned int *)t12) = t15;
    t16 = *((unsigned int *)t12);
    t17 = (t16 != 0);
    if (t17 == 1)
        goto LAB6;

LAB7:
LAB8:    t38 = (t7 + 4);
    t39 = *((unsigned int *)t38);
    t40 = (~(t39));
    t41 = *((unsigned int *)t7);
    t42 = (t41 & t40);
    t43 = (t42 != 0);
    if (t43 > 0)
        goto LAB9;

LAB10:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1368U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng3)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 32, t3, 32, t2, 32);
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t7, 0, 0, 32);

LAB11:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);

LAB12:    t2 = ((char*)((ng1)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t30 == 1)
        goto LAB13;

LAB14:    t2 = ((char*)((ng4)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t30 == 1)
        goto LAB15;

LAB16:    t2 = ((char*)((ng5)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t30 == 1)
        goto LAB17;

LAB18:    t2 = ((char*)((ng6)));
    t30 = xsi_vlog_unsigned_case_compare(t3, 2, t2, 2);
    if (t30 == 1)
        goto LAB19;

LAB20:
LAB21:    goto LAB2;

LAB6:    t18 = *((unsigned int *)t7);
    t19 = *((unsigned int *)t12);
    *((unsigned int *)t7) = (t18 | t19);
    t20 = (t5 + 4);
    t21 = (t6 + 4);
    t22 = *((unsigned int *)t5);
    t23 = (~(t22));
    t24 = *((unsigned int *)t20);
    t25 = (~(t24));
    t26 = *((unsigned int *)t6);
    t27 = (~(t26));
    t28 = *((unsigned int *)t21);
    t29 = (~(t28));
    t30 = (t23 & t25);
    t31 = (t27 & t29);
    t32 = (~(t30));
    t33 = (~(t31));
    t34 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t34 & t32);
    t35 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t35 & t33);
    t36 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t36 & t32);
    t37 = *((unsigned int *)t7);
    *((unsigned int *)t7) = (t37 & t33);
    goto LAB8;

LAB9:    xsi_set_current_line(34, ng0);
    t44 = (t0 + 1368U);
    t45 = *((char **)t44);
    t44 = ((char*)((ng1)));
    t48 = (t0 + 1048U);
    t49 = *((char **)t48);
    memset(t47, 0, 8);
    t48 = (t47 + 4);
    t50 = (t49 + 4);
    t51 = *((unsigned int *)t49);
    t52 = (t51 >> 0);
    *((unsigned int *)t47) = t52;
    t53 = *((unsigned int *)t50);
    t54 = (t53 >> 0);
    *((unsigned int *)t48) = t54;
    t55 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t55 & 65535U);
    t56 = *((unsigned int *)t48);
    *((unsigned int *)t48) = (t56 & 65535U);
    t58 = ((char*)((ng2)));
    t59 = (t0 + 1048U);
    t60 = *((char **)t59);
    memset(t61, 0, 8);
    t59 = (t61 + 4);
    t62 = (t60 + 4);
    t63 = *((unsigned int *)t60);
    t64 = (t63 >> 15);
    t65 = (t64 & 1);
    *((unsigned int *)t61) = t65;
    t66 = *((unsigned int *)t62);
    t67 = (t66 >> 15);
    t68 = (t67 & 1);
    *((unsigned int *)t59) = t68;
    xsi_vlog_mul_concat(t57, 14, 1, t58, 1U, t61, 1);
    xsi_vlogtype_concat(t46, 32, 32, 3U, t57, 14, t47, 16, t44, 2);
    memset(t69, 0, 8);
    xsi_vlog_unsigned_add(t69, 32, t45, 32, t46, 32);
    t70 = (t0 + 2408);
    xsi_vlogvar_assign_value(t70, t69, 0, 0, 32);
    goto LAB11;

LAB13:    xsi_set_current_line(38, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = ((char*)((ng3)));
    memset(t7, 0, 8);
    xsi_vlog_unsigned_add(t7, 32, t5, 32, t4, 32);
    t6 = (t0 + 2568);
    xsi_vlogvar_assign_value(t6, t7, 0, 0, 32);
    goto LAB21;

LAB15:    xsi_set_current_line(39, ng0);
    t4 = (t0 + 2408);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t11 = (t0 + 2568);
    xsi_vlogvar_assign_value(t11, t6, 0, 0, 32);
    goto LAB21;

LAB17:    xsi_set_current_line(40, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t5, 0, 0, 32);
    goto LAB21;

LAB19:    xsi_set_current_line(41, ng0);
    t4 = ((char*)((ng1)));
    t5 = (t0 + 1048U);
    t6 = *((char **)t5);
    memset(t46, 0, 8);
    t5 = (t46 + 4);
    t11 = (t6 + 4);
    t8 = *((unsigned int *)t6);
    t9 = (t8 >> 0);
    *((unsigned int *)t46) = t9;
    t10 = *((unsigned int *)t11);
    t13 = (t10 >> 0);
    *((unsigned int *)t5) = t13;
    t14 = *((unsigned int *)t46);
    *((unsigned int *)t46) = (t14 & 67108863U);
    t15 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t15 & 67108863U);
    t12 = (t0 + 1048U);
    t20 = *((char **)t12);
    memset(t47, 0, 8);
    t12 = (t47 + 4);
    t21 = (t20 + 4);
    t16 = *((unsigned int *)t20);
    t17 = (t16 >> 28);
    *((unsigned int *)t47) = t17;
    t18 = *((unsigned int *)t21);
    t19 = (t18 >> 28);
    *((unsigned int *)t12) = t19;
    t22 = *((unsigned int *)t47);
    *((unsigned int *)t47) = (t22 & 15U);
    t23 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t23 & 15U);
    xsi_vlogtype_concat(t7, 32, 32, 3U, t47, 4, t46, 26, t4, 2);
    t38 = (t0 + 2568);
    xsi_vlogvar_assign_value(t38, t7, 0, 0, 32);
    goto LAB21;

}

static void Cont_44_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 3736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(44, ng0);
    t2 = (t0 + 2568);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4152);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t4, 8);
    xsi_driver_vfirst_trans(t5, 0, 31);
    t10 = (t0 + 4072);
    *((int *)t10) = 1;

LAB1:    return;
}


extern void work_m_00000000000363513980_0757879789_init()
{
	static char *pe[] = {(void *)Always_32_0,(void *)Cont_44_1};
	xsi_register_didat("work_m_00000000000363513980_0757879789", "isim/mips_tb_isim_beh.exe.sim/work/m_00000000000363513980_0757879789.didat");
	xsi_register_executes(pe);
}

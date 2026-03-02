                                RSRESET
DEF robotBaseStats_unk00        RB 2
DEF robotBaseStats_enhancesInto RB 1
DEF robotBaseStats_unk03        RB 4
DEF robotBaseStats_HP           RB 1
DEF robotBaseStats_EP           RB 1
DEF robotBaseStats_Attack       RB 1
DEF robotBaseStats_Defense      RB 1
DEF robotBaseStats_Speed        RB 1
DEF robotBaseStats_unk0B        RB 1
DEF robotBaseStats_Name         RB ROBOT_NAME_LENGTH
DEF robotBaseStats_unk13        RB 28
DEF robotBaseStats_SIZEOF       RB 0

IF DEF(LANG_JP)
DEF part_SIZEOF EQU 24
ELIF DEF(LANG_EN)
DEF part_SIZEOF EQU 26
ENDC

IF DEF(LANG_JP)
DEF partyRobot_SIZEOF EQU 35
ELIF DEF(LANG_EN)
DEF partyRobot_SIZEOF EQU 36
ENDC

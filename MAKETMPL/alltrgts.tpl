#############################################################################
#                                                                           #
#              Copyright 1996 by Microware Systems Corporation              #
#                            All Rights Reserved                            #
#                          Reproduced Under License                         #
#                                                                           #
#  This software is confidential property of Microware Systems Corporation, #
#  and is provided under license for internal development purposes only.    #
#  Reproduction, publication, distribution, or creation of derivative works #
#  in any form to any party other than the licensee is strictly prohibited, #
#  unless expressly authorized in writing by Microware Systems Corporation. #
#                                                                           #
#############################################################################
#                                                                           #
# Edition History:                                                          #
# #   Date    Comments                                                By    #
# -- -------- ------------------------------------------------------- ---   #
# 01 96/08/03 Added edition history.                                  rak   #
#             ---- OS-9000/x86 V2.1 Released ----                           #
#             ---- OS-9000/PPC V2.1.1 Released ----                         #
#             ---- OS-9/68K V3.0.3 System-state Debug Support Release ---   #
#             ---- OS-9000/ARMv3 V2.2 Released ----                         #
#             ---- OS-9000/ARMv3 V2.2.1 Released ----                       #
#             ---- OS-9000/SH3 V2.2.6 Released ----                         #
#             ---- Makefile Support Sub-component v1.1 Released ----        #
#             ---- OS-9000/SPARC V2.2.7 Released ----                       #
#             ---- Makefile Support Sub-component v1.1.1 Released ----      #
#             ---- Makefile Support Sub-component v1.2 Released ----        #
#             ---- Makefile Support Sub-component v1.2.1 Released ----      #
#             ---- Makefile Support Sub-component v1.2.2 Released ----      #
# 02 99/09/30 Added comment block below                                mgh  #
#             $$                    <RELEASE_INFO>                     $$   #
#############################################################################
# Definition of ALL_TRGTS                                                   #
#                                                                           #
# THE ALL_TRGTS Macro is used to control which processor targets will be    #
# used when calling makefiles without a processor specified.  The           #
# alltrgts.tpl file is built automatically during the MWOS creation/product #
# installation.  The file may be edited by hand to change the targets you   #
# wish to build for when simply typeing "(os9)make.  NOTE: the alltrgts.tpl #
# file will be be rebuilt by subsequent product installations and will      #
# require editing again after installation.  NOTE: you can also build for a #
# specific processor target by typing: (os9)make all.<trgt> where <trgt> is #
# one of the target processor strings listed below.                         #
#                                                                           #
#############################################################################
ALL_TRGTS	= \
 k68k \

#                                                                           #
#############################################################################

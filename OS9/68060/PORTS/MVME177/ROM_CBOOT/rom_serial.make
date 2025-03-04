# Makefile for the I/O driver in the MVME177 ROM
-mode=compat
-bo
-x

MWOS		= ../../../../..
ROOT		= ../../../..				# base of dir system (OS9)

BASEROOT	= $(ROOT)/68000				# dir system for LIB, etc
CPUROOT		= $(ROOT)/68060				# dir system for output
SRCROOT		= $(ROOT)/SRC				# dir system for source

SDIR		= $(SRCROOT)/ROM/SERIAL		# specific source dir

TYPE		= ROMBUG
RDIR		= RELS/$(TYPE)
RDUP		= ../..

SYSDEFS		= $(SRCROOT)/DEFS			# std OS defs
SYSMACS		= $(SRCROOT)/MACROS

MAKER		= rom_serial.make

OBJECTS		= iocd2401.r

OLIB		= rom_serial.l

COMDEFS		= $(SYSDEFS)/oskdefs.d $(SYSDEFS)/nvram.d
DEFS		= ../systype.d $(COMDEFS)

RBUG		= -aROMBUG

INHOUSE		= #-aINHOUSE
MBUGTRC		= #-aMBUGTRC # enables MBUG tracing and breakpoints for testing
RAMLOAD		= #-aRAMLOAD # support rombug load directly for porting

SPEC_RFLAGS	= $(INHOUSE) $(MBUGTRC) $(RAMLOAD) #-aFASTCONS

RC			= r68
SRCHDIRS	= -u=. -u=$(SYSDEFS) -u=$(SYSMACS)
RFLAGS		= -q -aCBOOT $(RBUG) $(SPEC_RFLAGS) $(SRCHDIRS)

include		$(MWOS)/MAKETMPL/makeosk.tpl

$(RDIR)/$(OLIB): makdir $(OBJECTS)
	-$(CODO) $@
	-$(DEL)  $@
	$(CHD) $(RDIR); $(MERGE) $(MOPTS) $(OBJECTS) $(REDIR_OUT)$(OLIB)

$(RDIR)/$(OBJECTS) : $(DEFS) $(MAKER)

makdir _makdir:
    -$(MAKDIR) $(RDIR)
 
clean _clean:
	-$(DEL) $(RDIR)/iocd2401.r

purge _purge:
	-$(CODO) $(RDIR)/$(OLIB)
	-$(DEL)  $(RDIR)/$(OLIB)



# DO NOT EDIT!  Automatically generated by Cabal

modules = Graphics.UI.Clutter.Types Graphics.UI.Clutter.Signals Graphics.UI.Clutter.GValue Graphics.UI.Clutter.Utility Graphics.UI.Clutter.External Graphics.UI.Clutter.StoreValue Graphics.UI.Clutter.General Graphics.UI.Clutter.Color Graphics.UI.Clutter.Actor Graphics.UI.Clutter.Rectangle Graphics.UI.Clutter.Texture Graphics.UI.Clutter.Container Graphics.UI.Clutter.Group Graphics.UI.Clutter.Event Graphics.UI.Clutter.Text Graphics.UI.Clutter.Stage Graphics.UI.Clutter.Animation Graphics.UI.Clutter.Animatable Graphics.UI.Clutter.Timeline Graphics.UI.Clutter.Score Graphics.UI.Clutter.CairoTexture Graphics.UI.Clutter.Alpha Graphics.UI.Clutter.Media Graphics.UI.Clutter.ChildMeta Graphics.UI.Clutter.Clone Graphics.UI.Clutter.Behaviour Graphics.UI.Clutter.BehaviourScale Graphics.UI.Clutter.BehaviourDepth Graphics.UI.Clutter.BehaviourEllipse Graphics.UI.Clutter.BehaviourOpacity Graphics.UI.Clutter.BehaviourRotate Graphics.UI.Clutter.BehaviourPath Graphics.UI.Clutter.Interval Graphics.UI.Clutter.Path Graphics.UI.Clutter.Shader Graphics.UI.Clutter.Model Graphics.UI.Clutter.ModelIter Graphics.UI.Clutter.Script Graphics.UI.Clutter.Units Graphics.UI.Clutter.Scriptable Graphics.UI.Clutter.BindingPool Graphics.UI.Clutter.X11 Graphics.UI.Clutter.Utilities Graphics.UI.Clutter.ListModel Graphics.UI.Clutter
GHC = /usr/bin/ghc
GHC_VERSION = 6.10.4
VANILLA_WAY = YES
WAYS = 
odir = dist/build
package = clutterhs-0.0.1
GHC_OPTS = -package-name clutterhs-0.0.1 -hide-all-packages -no-user-package-conf -i -idist/build -i. -i./Graphics -i./Graphics/UI -i./Graphics/UI/Clutter -idist/build/autogen -Idist/build/autogen -Idist/build -I/usr/include/clutter-1.0/ -I/usr/include/glib-2.0 -I/usr/include/glib-2.0/glib -I/usr/lib/glib-2.0/include -I/usr/include/pango-1.0/ -I/usr/include/cairo -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/clutter-1.0 -I/usr/include/drm -optP-DDEBUG -optP-include -optPdist/build/autogen/cabal_macros.h -\#include "clutter/clutter.h" -odir dist/build -hidir dist/build -stubdir dist/build -package base-4.1.0.0 -package cairo-0.10.1 -package glib-0.10.1 -package gtk-0.10.1 -package haskell98-1.0.1.0 -package mtl-1.1.0.2 -O -W -XCPP -XFlexibleInstances -XForeignFunctionInterface -XTypeSynonymInstances
MAKEFILE = Makefile
C_SRCS = 
GHC_CC_OPTS = -I/usr/include/clutter-1.0/ -I/usr/include/glib-2.0 -I/usr/include/glib-2.0/glib -I/usr/lib/glib-2.0/include -I/usr/include/pango-1.0/ -I/usr/include/cairo -I/usr/include/gtk-2.0 -I/usr/lib/gtk-2.0/include -I/usr/include/atk-1.0 -I/usr/include/pango-1.0 -I/usr/include/pixman-1 -I/usr/include/freetype2 -I/usr/include/libpng12 -I/usr/include/clutter-1.0 -I/usr/include/drm -package base-4.1.0.0 -package cairo-0.10.1 -package glib-0.10.1 -package gtk-0.10.1 -package haskell98-1.0.1.0 -package mtl-1.1.0.2 -optc-DDEBUG -O0 -g -optc-pthread -optc-O2 -odir dist/build
GHCI_LIB = dist/build/HSclutterhs-0.0.1.o
soext = so
LIB_LD_OPTS = -package-name clutterhs-0.0.1 -package base-4.1.0.0 -package cairo-0.10.1 -package glib-0.10.1 -package gtk-0.10.1 -package haskell98-1.0.1.0 -package mtl-1.1.0.2 -lgtk-x11-2.0 -lgdk-x11-2.0 -latk-1.0 -lgio-2.0 -lpangoft2-1.0 -lfreetype -lfontconfig -lclutter-glx-1.0 -lpangocairo-1.0 -lgthread-2.0 -lrt -lgdk_pixbuf-2.0 -lGL -lX11 -lXext -lXdamage -lXcomposite -lpango-1.0 -lcairo -lgobject-2.0 -lgmodule-2.0 -lglib-2.0 -lXfixes
AR = /usr/bin/ar
LD = /usr/bin/ld -x
GENERATE_DOT_DEPEND = -dep-makefile $(odir)/.depend

WAY_p_OPTS = -prof
WAY_dyn_OPTS = -fPIC -dynamic
WAY_dyn_CC_OPTS = -fPIC

ifneq "$(way)" ""
way_ := $(way)_
_way := _$(way)
GHC_OPTS += $(WAY_$(way)_OPTS)
GHC_OPTS += -hisuf $(way_)hi -hcsuf $(way_)hc -osuf $(osuf)
GHC_CC_OPTS += $(WAY_$(way)_CC_OPTS)
endif

osuf  = $(way_)o
hisuf = $(way_)hi

ifneq "$(odir)" ""
odir_ = $(odir)/
else
odir_ =
endif


# -----------------------------------------------------------------------------
# Makefile template starts here.

default: all

GHC_OPTS += -i$(odir)

# For adding options on the command-line
GHC_OPTS += $(EXTRA_HC_OPTS)

HS_OBJS = $(patsubst %,$(odir)/%.$(osuf),$(subst .,/,$(modules)))
HS_IFS  = $(patsubst %,$(odir)/%.$(hisuf),$(subst .,/,$(modules)))
C_OBJS  = $(patsubst %.c,$(odir)/%.$(osuf),$(C_SRCS))

ifeq "$(way:%dyn=YES)" "YES"
LIB = $(odir)/libHS$(package)$(_way:%_dyn=%)-ghc$(GHC_VERSION)$(soext)
else
LIB = $(odir)/libHS$(package)$(_way).a
endif

RM = rm -f

# Optionally include local customizations:
-include Makefile.local

# Rules follow:

MKSTUBOBJS = find $(odir) -name "*_stub.$(osuf)" -print
# HACK ^^^ we tried to use $(wildcard), but apparently it fails due to
# make using cached directory contents, or something.

# We have to jump through some hoops if we don't want the vanilla way,
# as it's handled specially
ifneq "$(way) $(VANILLA_WAY)" " NO"
all :: $(odir)/.depend $(LIB)
endif

$(odir)/.depend : $(MAKEFILE)
	$(GHC) -M $(GENERATE_DOT_DEPEND) $(foreach way,$(WAYS),-dep-suffix-s -dep-suffix$(way)) $(foreach obj,$(MKDEPENDHS_OBJ_SUFFICES),-osuf $(obj)) $(filter-out -split-objs, $(GHC_OPTS)) $(modules)
	for dir in $(sort $(foreach mod,$(HS_OBJS) $(C_OBJS),$(dir $(mod)))); do \
		if test ! -d $$dir; then mkdir -p $$dir; fi \
	done

include $(odir)/.depend

ifeq "$(way:%dyn=YES)" "YES"
$(LIB) : $(HS_OBJS) $(C_OBJS)
	@$(RM) $@
	$(GHC) -shared -dynamic -no-auto-link-packages -o $@ $(C_OBJS) $(HS_OBJS) `$(MKSTUBOBJS)` $(LIB_LD_OPTS)
else
ifneq "$(filter -split-objs, $(GHC_OPTS))" ""
$(LIB) : $(HS_OBJS) $(C_OBJS)
	@$(RM) $@
	(echo $(C_OBJS) `$(MKSTUBOBJS)`; find $(patsubst %.$(osuf),%_split,$(HS_OBJS)) -name '*.$(way_)o' -print) | xargs $(AR) q $(EXTRA_AR_ARGS) $@
else
$(LIB) : $(HS_OBJS) $(C_OBJS)
	@$(RM) $@
	echo $(C_OBJS) $(HS_OBJS) `$(MKSTUBOBJS)` | xargs $(AR) q $(EXTRA_AR_ARGS) $@
endif
endif

ifneq "$(GHCI_LIB)" ""
ifeq "$(way)" ""
all ::  $(GHCI_LIB)

$(GHCI_LIB) : $(HS_OBJS) $(C_OBJS)
	@$(RM) $@
	$(LD) -r -o $@ $(EXTRA_LD_OPTS) $(HS_OBJS) `$(MKSTUBOBJS)` $(C_OBJS)
endif
endif

# suffix rules

# The .hs files might be in $(odir) if they were preprocessed
$(odir_)%.$(osuf) : $(odir_)%.hs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : $(odir_)%.lhs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : %.c
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(way_)s : %.c
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -S $< -o $@

%.$(hisuf) : %.$(osuf)
	@if [ ! -f $@ ] ; then \
	    echo Panic! $< exists, but $@ does not.; \
	    exit 1; \
	else exit 0 ; \
	fi

%.$(way_)hi-boot : %.$(osuf)-boot
	@if [ ! -f $@ ] ; then \
	    echo Panic! $< exists, but $@ does not.; \
	    exit 1; \
	else exit 0 ; \
	fi

$(odir_)%.$(hisuf) : %.$(way_)hc
	@if [ ! -f $@ ] ; then \
	    echo Panic! $< exists, but $@ does not.; \
	    exit 1; \
	else exit 0 ; \
	fi

show:
	@echo '$(VALUE)="$($(VALUE))"'

clean ::
	$(RM) $(HS_OBJS) $(C_OBJS) $(LIB) $(GHCI_LIB) $(HS_IFS) .depend
	$(RM) -rf $(wildcard $(patsubst %.$(osuf), %_split, $(HS_OBJS)))
	$(RM) $(wildcard $(patsubst %.$(osuf), %.o-boot, $(HS_OBJS)))
	$(RM) $(wildcard $(patsubst %.$(osuf), %.hi-boot, $(HS_OBJS)))
	$(RM) $(wildcard $(patsubst %.$(osuf), %_stub.o, $(HS_OBJS)))

ifneq "$(strip $(WAYS))" ""
ifeq "$(way)" ""
all clean ::
# Don't rely on -e working, instead we check exit return codes from sub-makes.
	@case '${MFLAGS}' in *-[ik]*) x_on_err=0;; *-r*[ik]*) x_on_err=0;; *) x_on_err=1;; esac; \
	for i in $(WAYS) ; do \
	  echo "== $(MAKE) way=$$i -f $(MAKEFILE) $@;"; \
	  $(MAKE) way=$$i -f $(MAKEFILE) --no-print-directory $(MFLAGS) $@ ; \
	  if [ $$? -eq 0 ] ; then true; else exit $$x_on_err; fi; \
	done
	@echo "== Finished recursively making \`$@' for ways: $(WAYS) ..."
endif
endif


$(odir_)%.$(osuf) : ./%.hs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./%.lhs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./%.$(way_)s
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf) : ./%.S
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf)-boot : ./%.hs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf)-boot : ./%.lhs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf) : ./Graphics/%.hs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./Graphics/%.lhs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./Graphics/%.$(way_)s
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf) : ./Graphics/%.S
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf)-boot : ./Graphics/%.hs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf)-boot : ./Graphics/%.lhs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf) : ./Graphics/UI/%.hs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./Graphics/UI/%.lhs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./Graphics/UI/%.$(way_)s
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf) : ./Graphics/UI/%.S
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf)-boot : ./Graphics/UI/%.hs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf)-boot : ./Graphics/UI/%.lhs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf) : ./Graphics/UI/Clutter/%.hs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./Graphics/UI/Clutter/%.lhs
	$(GHC) $(GHC_OPTS) -c $< -o $@  -ohi $(basename $@).$(hisuf)

$(odir_)%.$(osuf) : ./Graphics/UI/Clutter/%.$(way_)s
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf) : ./Graphics/UI/Clutter/%.S
	@$(RM) $@
	$(GHC) $(GHC_CC_OPTS) -c $< -o $@

$(odir_)%.$(osuf)-boot : ./Graphics/UI/Clutter/%.hs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot

$(odir_)%.$(osuf)-boot : ./Graphics/UI/Clutter/%.lhs-boot
	$(GHC) $(GHC_OPTS) -c $< -o $@ -ohi $(basename $@).$(way_)hi-boot



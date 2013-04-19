BRD_SRCS = ./cyrf6936-bob.brd

GERBER_DIR = gerbers/

##### This substitutions work only with EXACTLY ONE level of subdirectory !!!!!
SCHEMATICS=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.schematics.ps))
TOP_LAYER=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.top_layer.ps))
TOP_LAYER_SCALED=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.top_layer_scaled.ps))
TOP_COMP=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.top_comp.ps))
TOP_COMP_SCALED=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.top_comp_scaled.ps))
BOTTOM_LAYER=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.bottom_layer.ps))
BOTTOM_LAYER_SCALED=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.bottom_layer_scaled.ps))
BOTTOM_COMP=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.bottom_comp.ps))
BOTTOM_COMP_SCALED=$(subst /,/printable/,$(BRD_SRCS:%.brd=%.bottom_comp_scaled.ps))
POSTSCRIPTS= $(SCHEMATICS) $(TOP_LAYER) $(TOP_COMP) $(BOTTOM_LAYER) $(BOTTOM_COMP) $(TOP_LAYER_SCALED) $(TOP_COMP_SCALED) $(BOTTOM_LAYER_SCALED) $(BOTTOM_COMP_SCALED)
PDF=$(POSTSCRIPTS:%.ps=%.pdf)
EAGLE_EXE=/Applications/EAGLE-6.4.0/EAGLE.app/Contents/MacOS/EAGLE


GERB_O = $(BRD_SRCS:.brd=.all)

all: printable gerber

gerber: $(GERB_O)

# printable: dirs $(POSTSCRIPTS) $(PDF)
printable: dirs $(POSTSCRIPTS) $(PDF)

dirs :
	#mkdir -p $(DIRS:%=%/printable)
	mkdir -p printable
	mkdir -p gerbers


### GERBER GENERATION

## original voodoo
#.PRECIOUS : %.cmp %.sol %.stc %.sts %.tplc %.bplc %.bor %.xln %.l02 %.l15 %.tcr %.bcr %.sor
#%.all: %.cmp %.sol %.stc %.sts %.tplc %.bplc %.xln %.bor %.l02 %.l15 %.tcr %.bcr %.sor

.PRECIOUS : %.top %.bot %.smt %.smb %.tslk %.bslk %.oln %.xln %.tcr %.bcr 
%.all : %.top %.bot %.smt %.smb %.tslk %.bslk %.oln %.xln %.tcr %.bcr 
	touch $@

# Component side
%.top : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< Top Pads Vias

# Solder side
%.bot : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< Bottom Pads Vias

# Solder stop mask comp. side
%.smt : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< tStop

# Solder stop mask sold. side
%.smb : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< bStop
# Silkscreen comp. side
%.tslk : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< Dimension tPlace tDocu tNames

# Silkscreen sold. side
%.bslk : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< Dimension bPlace bDocu bNames

# Cream comp. side
%.tcr: %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< tCream

# Cream sold. side
%.bcr: %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< bCream

# Drill data for NC drill st.
# warning : eagle takes path of -R option from input file directory.
%.xln : %.brd
	$(EAGLE_EXE) -X -N -d EXCELLON -E -0.01 -E 0.1 -o $(GERBER_DIR)$@ $< Drills Holes

# Outline
%.oln : %.brd
	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< Dimension

# Scoring layer
#%.sor : %.brd
#	$(EAGLE_EXE) -X -N -d GERBER_RS274X -o $(GERBER_DIR)$@ $< VScore


### POSTSCRIPT AND PDF GENERATION


%.pdf : %.ps
	ps2pdf $< $@

%.schematics.ps : ../%.sch
	$(EAGLE_EXE) -X -N -d PS -s.63 -r -o $@ $< Nets Busses Symbols Names Values

%.top_layer.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -m+ -d PS -h6 -w10 -o $@ $< Top Pad Via Dimension

%.top_layer_scaled.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -m+ -d PS -s2.5 -o $@ $< Top Pad Via Dimension

%.top_comp.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -d PS -h6 -w10 -o $@ $< Pad Via Dimension tPlace tNames tDocu

%.top_comp_scaled.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -d PS -s2.5 -o $@ $< Pad Via Dimension tPlace tNames tDocu

%.bottom_layer.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -d PS -h6 -w10 -o $@ $< Bottom Pad Via Dimension

%.bottom_layer_scaled.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -d PS -s2.5 -o $@ $< Bottom Pad Via Dimension

%.bottom_comp.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -m+ -c -d PS -h6 -w10 -o $@ $< Pad Via Dimension bPlace bNames bDocu

%.bottom_comp_scaled.ps : ../%.brd
	$(EAGLE_EXE) -X -N -f- -m+ -c -d PS -s2.5 -o $@ $< Pad Via Dimension bPlace bNames bDocu


clean:
	@# gerber and excellon
	find .. -name '*.cmp' -exec rm -f {} \;
	find .. -name '*.sol' -exec rm -f {} \;
	find .. -name '*.stc' -exec rm -f {} \;
	find .. -name '*.sts' -exec rm -f {} \;
	find .. -name '*.tplc' -exec rm -f {} \;
	find .. -name '*.bplc' -exec rm -f {} \;
	find .. -name '*.bor' -exec rm -f {} \;
	find .. -name '*.xln' -exec rm -f {} \;
	find .. -name '*.dri' -exec rm -f {} \;
	find .. -name '*.gpi' -exec rm -f {} \;
	find .. -name '*.l02' -exec rm -f {} \;
	find .. -name '*.l15' -exec rm -f {} \;
	find .. -name '*.all' -exec rm -f {} \;
	find .. -name '*.tcr' -exec rm -f {} \;
	find .. -name '*.bcr' -exec rm -f {} \;
	find .. -name '*.sor' -exec rm -f {} \;
	@# printable
	find . -name '*.schematics.ps' -exec rm -f {} \;
	find . -name '*.schematics.pdf' -exec rm -f {} \;
	find . -name '*.top_layer.ps' -exec rm -f {} \;
	find . -name '*.top_layer.pdf' -exec rm -f {} \;
	find . -name '*.top_comp.ps' -exec rm -f {} \;
	find . -name '*.top_comp.pdf' -exec rm -f {} \;
	find . -name '*.bottom_layer.ps' -exec rm -f {} \;
	find . -name '*.bottom_layer.pdf' -exec rm -f {} \;
	find . -name '*.bottom_comp.ps' -exec rm -f {} \;
	find . -name '*.bottom_comp.pdf' -exec rm -f {} \;
	@# eagle error log
	find .. -name '*.erc' -exec rm -f {} \;
	@# eagle autorouter log
	find .. -name '*.pro' -exec rm -f {} \;
	@# eagle backups	
	find .. -name '*#*' -exec rm -f {} \;
	@# emacs backups
	find .. -name '*~' -exec rm -f {} \;

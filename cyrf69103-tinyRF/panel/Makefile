GERBMERGE = gerbmerge
GERBV = gerbv

CFG=layout.cfg
DEF=layout.def

_panel: 
	cd ..; make gerber
	$(GERBMERGE) --no-trim-gerber $(CFG) $(DEF)


_view:
	$(GERBV) merged.*.ger merged.*.oln



clean:
	rm -f merged.* *~

GERBMERGE = gerbmerge
GERBV = gerbv

CFG=layout.cfg
DEF=layout-6x6.def

_panel: 
	cd ..; make gerber
	$(GERBMERGE) --no-trim-gerber $(CFG) $(DEF)


_view:
	$(GERBV) *bob*



clean:
	rm -f merged.* *~

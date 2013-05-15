cp ../../panel/p-* .
mv *.xln  cyrf6936-BoB.excellon.TXT
mv p-cyrf6936-BoB.board_outline.oln  cyrf6936-BoB.board_outline.GML
mv *.tcr  cyrf6936-BoB.top_cream.GTP
mv *.bcr  cyrf6936-BoB.bottom_cream.GBP
mv *.smt  cyrf6936-BoB.top_mask.GTS
mv *.smb  cyrf6936-BoB.bottom_mask.GBS
mv *.tslk cyrf6936-BoB.top_silk.GTO
mv *.bslk cyrf6936-BoB.bottom_silk.GBO
mv *.top  cyrf6936-BoB.top_copper.GTL
mv *.bot  cyrf6936-BoB.bottom_copper.GBL
mv p-cyrf6936-BoB.placement.txt cyrf6936-BoB.placement.txt
mv p-cyrf6936-BoB.fab.ger cyrf6936-BoB.fab.ger
mv p-cyrf6936-BoB.toollist.drl cyrf6936-BoB.toollist.drl

zip cyrf6936-BoB-hackvana-v0.3.zip cyrf6936-BoB.excellon.TXT cyrf6936-BoB.board_outline.GML cyrf6936-BoB.top_cream.GTP cyrf6936-BoB.bottom_cream.GBP cyrf6936-BoB.top_mask.GTS cyrf6936-BoB.bottom_mask.GBS cyrf6936-BoB.top_silk.GTO cyrf6936-BoB.bottom_silk.GBO cyrf6936-BoB.top_copper.GTL cyrf6936-BoB.bottom_copper.GBL cyrf6936-BoB.placement.txt cyrf6936-BoB.fab.ger cyrf6936-BoB.toollist.drl

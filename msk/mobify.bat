@echo off
set KCCLOC=C:\kcc-master\kcc-c2e.py
FOR %%I in (*.zip) DO python %KCCLOC% "%%I" -m -f MOBI -r 2
FOR %%I in (*.rar) DO python %KCCLOC% "%%I" -m -f MOBI -r 2
FOR %%I in (*.cbz) DO python %KCCLOC% "%%I" -m -f MOBI -r 2
FOR %%I in (*.cbr) DO python %KCCLOC% "%%I" -m -f MOBI -r 2

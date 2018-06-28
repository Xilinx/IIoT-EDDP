cd doxygen
"%ProgramFiles%\doxygen\bin\doxygen.exe" Doxyfile
set PATH=%PATH%;C:\Program Files\MiKTeX 2.9\miktex\bin\x64
cd ..
cd doc\latex
@call make.bat
copy refman.pdf ..\..\Embedded_Linux_Code.pdf

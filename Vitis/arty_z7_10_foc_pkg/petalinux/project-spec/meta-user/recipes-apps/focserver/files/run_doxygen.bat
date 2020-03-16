cd doxygen
"%ProgramFiles%\doxygen\bin\doxygen.exe" Doxyfile
cd ..
cd doc\latex
@call make.bat
copy refman.pdf ..\..\Embedded_Linux_Code.pdf

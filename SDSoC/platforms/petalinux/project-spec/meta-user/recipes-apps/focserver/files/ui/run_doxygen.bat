cd doxygen
c:\Programme\doxygen\bin\doxygen.exe Doxyfile
cd ..
cd doc\latex
@call make.bat
copy refman.pdf ..\..\Web_UI.pdf

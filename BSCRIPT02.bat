@echo off
setlocal enabledelayedexpansion

rem User choice
echo Choose a shape:
echo 1: Circle
echo 2: Triangle
echo 3: Quadrilateral

set /p shape="Enter chosen number: "

rem Shapes
if "%shape%"=="1" (
    call :Circle
    goto :eof
) else if "%shape%"=="2" (
    call :Triangle
    goto :eof
) else if "%shape%"=="3" (
    call :Quadrilateral
    goto :eof
) else (
    echo Invalid choice
    goto :eof
)

:eof
pause

rem Calculate area of circle
:Circle
set /p radius="Enter the radius of the circle: "
set /a area=(radius * radius * 314) / 100
echo The area of the circle is: !area!
goto :eof

rem Calculate area of triangle and determine type
:Triangle
set /p A="Enter the length of side A: "
set /p B="Enter the length of side B: "
set /p C="Enter the length of side C: "

rem Convert input to integers for calculation
set /a "A=!A!", "B=!B!", "C=!C!"

rem Calculate semi-perimeter
set /a "s=(A+B+C)/2"

rem Calculate area using Heron's formula
set /a "area=sqrt(s*(s-A)*(s-B)*(s-C))"

echo The area of the triangle is: !area!

rem Determine type of triangle
if !A! equ !B! (
    if !B! equ !C! (
        echo Type of Triangle = Equilateral
    ) else (
        echo Type of Triangle = Isosceles
    )
) else if !A! equ !C! (
    echo Type of Triangle = Isosceles
) else if !B! equ !C! (
    echo Type of Triangle = Isosceles
) else (
    echo Type of Triangle = Scalene
)
goto :eof
pause

rem Calculate area of quadrilateral and determine type
:Quadrilateral
set /p length="Enter the length: "
set /p width="Enter the width: "
set /a area=length * width
echo The area of the quadrilateral: !area!

if "!length!"=="!width!" (
    echo Type of Quadrilateral = Square
) else (
    echo Type of Quadrilateral = Rectangle
)
goto :eof
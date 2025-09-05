@echo off
echo ========================================
echo   Push to GitHub
echo ========================================
echo.

REM Set Git configuration
git config user.email "huongnth@vaa.edu.vn"
git config user.name "huongnth-cpu"

REM Add all files
echo Adding files...
git add .

REM Get current date and time for commit message
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "timestamp=%YYYY%-%MM%-%DD% %HH%:%Min%:%Sec%"

REM Commit changes
echo Committing with timestamp: %timestamp%
git commit -m "Auto commit: %timestamp%"

REM Push to GitHub
echo Pushing to GitHub...
git push origin main

echo.
echo ========================================
echo   Successfully pushed to GitHub!
echo ========================================
echo Repository: https://github.com/huongnth-cpu/AI-for-chinese-web.git
echo.
pause

@echo off
echo ========================================
echo   SETUP GIT REPOSITORY
echo ========================================
echo.

REM Check if git is initialized
if not exist ".git" (
    echo Initializing git repository...
    git init
    echo.
)

REM Set Git configuration
echo Setting up Git configuration...
git config user.email "huongnth@vaa.edu.vn"
git config user.name "huongnth-cpu"
echo.

REM Check if remote origin exists
echo Checking remote origin...
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo Adding remote origin...
    git remote add origin https://github.com/huongnth-cpu/AI-for-chinese-web.git
    echo ✓ Remote origin added
) else (
    echo Updating remote origin...
    git remote set-url origin https://github.com/huongnth-cpu/AI-for-chinese-web.git
    echo ✓ Remote origin updated
)

echo.

REM Check git status
echo Checking git status...
git status

echo.

REM Add all files
echo Adding all files...
git add .

echo.

REM Check if there are changes to commit
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo No changes to commit. Creating initial commit...
    echo # AI for Chinese Web - Law Search System > README.md
    echo. >> README.md
    echo This repository contains the AI-powered law search system for Vietnamese workers in Taiwan. >> README.md
    echo. >> README.md
    echo ## Features >> README.md
    echo - Legal document search >> README.md
    echo - AI translation (Chinese to Vietnamese) >> README.md
    echo - Legal terms dictionary >> README.md
    echo - User-friendly interface >> README.md
    echo. >> README.md
    echo ## Setup >> README.md
    echo 1. Clone the repository >> README.md
    echo 2. Run docker-compose up >> README.md
    echo 3. Access the application at http://localhost:3000 >> README.md
    
    git add README.md
    git commit -m "Initial commit: AI for Chinese Web - Law Search System"
    echo ✓ Initial commit created
) else (
    echo Changes detected, committing...
    for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
    set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
    set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
    set "timestamp=%YYYY%-%MM%-%DD% %HH%:%Min%:%Sec%"
    git commit -m "Auto commit: %timestamp%"
    echo ✓ Changes committed
)

echo.

REM Push to GitHub
echo Pushing to GitHub...
git push -u origin main
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCCESS: Pushed to GitHub!
    echo ========================================
    echo Repository: https://github.com/huongnth-cpu/AI-for-chinese-web.git
    echo.
) else (
    echo.
    echo ========================================
    echo   ERROR: Failed to push to GitHub
    echo ========================================
    echo.
    echo Possible solutions:
    echo 1. Check your internet connection
    echo 2. Verify repository exists: https://github.com/huongnth-cpu/AI-for-chinese-web
    echo 3. Check your GitHub credentials
    echo 4. Try: git push -u origin main --force
    echo.
)

echo.
pause

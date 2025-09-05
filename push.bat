@echo off
echo ========================================
echo    PUSH TO GITHUB - LAW SEARCH SYSTEM
echo ========================================
echo.

REM Check if git is initialized
if not exist ".git" (
    echo Initializing git repository...
    git init
    echo.
)

REM Add all files to staging
echo Adding files to staging...
git add .
echo.

REM Check if there are changes to commit
git diff --cached --quiet
if %errorlevel% equ 0 (
    echo No changes to commit.
    echo.
    pause
    exit /b 0
)

REM Get commit message from user
set /p commit_msg="Enter commit message (or press Enter for default): "
if "%commit_msg%"=="" (
    set commit_msg=Update law search system
)

REM Commit changes
echo Committing changes...
git commit -m "%commit_msg%"
echo.

REM Check if remote origin exists
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo No remote origin found. Please add remote repository:
    echo git remote add origin https://github.com/username/viet-tai-law-ai.git
    echo.
    pause
    exit /b 1
)

REM Push to GitHub
echo Pushing to GitHub...
git push origin main
if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo    SUCCESS: Pushed to GitHub!
    echo ========================================
) else (
    echo.
    echo ========================================
    echo    ERROR: Failed to push to GitHub
    echo ========================================
    echo.
    echo Trying to push to master branch...
    git push origin master
    if %errorlevel% equ 0 (
        echo.
        echo ========================================
        echo    SUCCESS: Pushed to master branch!
        echo ========================================
    ) else (
        echo.
        echo ========================================
        echo    ERROR: Failed to push to any branch
        echo ========================================
    )
)

echo.
echo Press any key to exit...
pause >nul

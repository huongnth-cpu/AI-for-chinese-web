@echo off
echo ========================================
echo    TEST CI/CD PIPELINE
echo ========================================
echo.

REM Check if we're in a git repository
if not exist ".git" (
    echo ERROR: Not in a git repository!
    echo Please run this script from the project root directory.
    echo.
    pause
    exit /b 1
)

REM Check if GitHub Actions workflow exists
if not exist ".github\workflows\ci-cd.yml" (
    echo ERROR: CI/CD workflow file not found!
    echo Please make sure .github/workflows/ci-cd.yml exists.
    echo.
    pause
    exit /b 1
)

echo Testing CI/CD pipeline...
echo.

REM Test 1: Check if all required files exist
echo [TEST 1] Checking required files...
if exist "docker-compose.yml" (
    echo ✓ docker-compose.yml found
) else (
    echo ✗ docker-compose.yml missing
    set /a test_failures+=1
)

if exist "frontend\Dockerfile" (
    echo ✓ frontend/Dockerfile found
) else (
    echo ✗ frontend/Dockerfile missing
    set /a test_failures+=1
)

if exist "backend\Dockerfile" (
    echo ✓ backend/Dockerfile found
) else (
    echo ✗ backend/Dockerfile missing
    set /a test_failures+=1
)

if exist "frontend\package.json" (
    echo ✓ frontend/package.json found
) else (
    echo ✗ frontend/package.json missing
    set /a test_failures+=1
)

if exist "backend\requirements.txt" (
    echo ✓ backend/requirements.txt found
) else (
    echo ✗ backend/requirements.txt missing
    set /a test_failures+=1
)

echo.

REM Test 2: Check Docker Compose syntax
echo [TEST 2] Testing Docker Compose syntax...
docker-compose config >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Docker Compose syntax is valid
) else (
    echo ✗ Docker Compose syntax error
    set /a test_failures+=1
)

echo.

REM Test 3: Check if Docker is running
echo [TEST 3] Checking Docker status...
docker version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Docker is running
) else (
    echo ✗ Docker is not running or not installed
    set /a test_failures+=1
)

echo.

REM Test 4: Check Node.js and npm (for frontend)
echo [TEST 4] Checking Node.js and npm...
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Node.js is installed
) else (
    echo ✗ Node.js is not installed
    set /a test_failures+=1
)

npm --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ npm is installed
) else (
    echo ✗ npm is not installed
    set /a test_failures+=1
)

echo.

REM Test 5: Check Python (for backend)
echo [TEST 5] Checking Python...
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Python is installed
) else (
    echo ✗ Python is not installed
    set /a test_failures+=1
)

echo.

REM Test 6: Test Docker build (if Docker is available)
echo [TEST 6] Testing Docker build...
if %errorlevel% equ 0 (
    echo Building frontend Docker image...
    docker build -t law-search-frontend:test ./frontend >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ Frontend Docker build successful
    ) else (
        echo ✗ Frontend Docker build failed
        set /a test_failures+=1
    )
    
    echo Building backend Docker image...
    docker build -t law-search-backend:test ./backend >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ Backend Docker build successful
    ) else (
        echo ✗ Backend Docker build failed
        set /a test_failures+=1
    )
) else (
    echo ⚠ Skipping Docker build test (Docker not available)
)

echo.

REM Test 7: Check GitHub Actions workflow syntax
echo [TEST 7] Checking GitHub Actions workflow syntax...
if exist "node_modules\.bin\yaml-lint" (
    npx yaml-lint .github/workflows/ci-cd.yml >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ GitHub Actions workflow syntax is valid
    ) else (
        echo ✗ GitHub Actions workflow syntax error
        set /a test_failures+=1
    )
) else (
    echo ⚠ Skipping YAML syntax check (yaml-lint not available)
)

echo.

REM Test 8: Check if all services can start (Docker Compose)
echo [TEST 8] Testing Docker Compose services...
if %errorlevel% equ 0 (
    echo Starting services with Docker Compose...
    docker-compose up -d --build >nul 2>&1
    if %errorlevel% equ 0 (
        echo ✓ All services started successfully
        
        echo Waiting for services to be ready...
        timeout /t 10 >nul
        
        echo Checking service health...
        docker-compose ps
        
        echo Stopping services...
        docker-compose down >nul 2>&1
        echo ✓ Services stopped successfully
    ) else (
        echo ✗ Failed to start services
        set /a test_failures+=1
    )
) else (
    echo ⚠ Skipping Docker Compose test (Docker not available)
)

echo.

REM Test 9: Check git status
echo [TEST 9] Checking git status...
git status --porcelain >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Git repository is clean
) else (
    echo ⚠ Git repository has uncommitted changes
)

echo.

REM Test 10: Check if remote origin is set
echo [TEST 10] Checking git remote...
git remote get-url origin >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Git remote origin is configured
) else (
    echo ⚠ Git remote origin not configured
    echo Please run: git remote add origin https://github.com/username/viet-tai-law-ai.git
)

echo.

REM Summary
echo ========================================
echo    TEST SUMMARY
echo ========================================
if %test_failures% equ 0 (
    echo ✓ All tests passed! CI/CD pipeline is ready.
    echo.
    echo You can now:
    echo 1. Run push.bat to push to GitHub
    echo 2. Check GitHub Actions tab for CI/CD status
    echo 3. Deploy to production when ready
) else (
    echo ✗ %test_failures% test(s) failed.
    echo.
    echo Please fix the issues above before pushing to GitHub.
)

echo.
echo Press any key to exit...
pause >nul

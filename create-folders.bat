@echo off


cd leave-service

:: Create subdirectories for leave-service
mkdir src
mkdir src\controllers
mkdir src\models
mkdir src\services
mkdir src\config
mkdir migrations

:: Create the main application file for the leave-service
echo # Leave Service > src\app.py

:: Create a requirements.txt file for Python dependencies
echo flask==2.1.1 > requirements.txt
echo flask_sqlalchemy==2.5.1 >> requirements.txt

:: Create a Dockerfile for the leave-service
echo FROM python:3.9-slim > Dockerfile
echo WORKDIR /app >> Dockerfile
echo COPY . /app >> Dockerfile
echo RUN pip install --no-cache-dir -r requirements.txt >> Dockerfile
echo CMD ["python", "src/app.py"] >> Dockerfile

:: Create a README.md for the leave-service documentation
echo # Leave Service Documentation > README.md
echo This is the leave service for the HRM system. It handles leave requests, approvals, and related operations. >> README.md

:: Create the .gitignore file
echo *.pyc > .gitignore
echo __pycache__/ >> .gitignore
echo .env >> .gitignore

:: Go back to the root directory
cd ../..

:: Notify user the script has finished
echo Folders and files for leave-service created successfully!
pause

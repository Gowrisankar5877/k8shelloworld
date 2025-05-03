pipeline {
    agent any

    environment {
        VENV_DIR = 'venv'
    }

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning GitHub repository...'
                // If you need credentials, set them up in Jenkins and reference them here with 'credentialsId'
                git branch: "main", url: "https://github.com/Gowrisankar5877/k8shelloworld.git"
            }
        }
        stage('Setup Python Environment') {
            steps {
                echo 'Setting up virtual environment...'
                sh '''
                    python3 -m venv $VENV_DIR
                    . $VENV_DIR/bin/activate
                    pip install --upgrade pip
                    pip install -r requirements.txt
                '''
            }
        }

        stage('Run Tests with Pytest') {
            steps {
                echo 'Running tests...'
                sh '''
                    . $VENV_DIR/bin/activate
                    pytest .
                '''
            }
        }

        stage('Code Coverage Report') {
            steps {
                echo 'Generating coverage report...'
                sh '''
                    . $VENV_DIR/bin/activate
                    coverage run -m pytest .
                    coverage report
                    coverage html
                '''
            }
        }
    }
}

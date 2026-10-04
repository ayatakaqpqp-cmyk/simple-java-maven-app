pipeline {
    agent { label 'windows-practice' }
    
    parameters {
        booleanParam(
            name: 'RUN_APP',
            defaultValue: false,
            description: 'ビルド後にアプリを実行する'
        )
         choice(
            name: 'SHELL_MODE',
            choices: ['success', 'failure', 'invalid'],
            description: 'シェルの終了パターン'
        )
    }
    stages {
       stage('shの動作確認') {
            steps {
            bat '''
            @echo off
            "C:/Program Files/Git/bin/sh.exe" practice.sh "%SHELL_MODE%"
            exit /b %ERRORLEVEL%
            '''
            }
        }
        stage('ビルド・テスト') {
            steps {
                bat 'mvn -B clean package'
            }
        }
        
    stage('アプリ実行') {
            when {
                expression {
                    return params.RUN_APP
                }
            }
            steps {

                bat 'java -jar target/my-app-1.0-SNAPSHOT.jar'
            }
        }

        stage('成果物保存') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar'
            }
        }

    }
            post {
            always {
                echo '【終了処理】成功・失敗に関係なく実行'
            }
            aborted {
                echo '【中断】タイムアウトまたは手動停止'
            }
            success {
                echo '【成功】すべての処理が正常終了'
            }
            failure {
                echo '【失敗】コンソール出力を確認してください'
            }
        }
}

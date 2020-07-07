def secrets=[[
            path:'credentials/artifactory',
            secretValues:[[envVar:'username',vaultKey:'usr'],[envVar:'pswd',vaultKey:'pswd']]
            ]]
def config=[vaultCredentialId: 'articreds']
pipeline{
    agent any
    stages{
        stage('build-deploy'){
            steps{
                execute "rake archive[0.0.%BUILD_NUMBER%]"
                //bat "cd C:/Jenkins/workspace/PolicyUpload && rake archive[0.0.%BUILD_NUMBER%]"
                //powershell(script: "cd C:/Jenkins/workspace/PolicyUpload/ ; dir ;rake archive[0.0.${BUILD_NUMBER}]")
                withVault([configuration: config,vaultSecrets: secrets]){
                    //bat "cd C:/Jenkins/workspace/PolicyUpload && rake deploy[%username%,%pswd%]"
                    //powershell(script:"cd C:/Jenkins/workspace/PolicyUpload/ ; rake deploy[${username},${pswd}]")
                }
            }
        }
    }
}
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
                bat "chef env --chef-license accept"
                bat "rake archive[0.0.%BUILD_NUMBER%]"
                withVault([configuration: config,vaultSecrets: secrets]){
                    bat "rake deploy[%username%,%pswd%]"
                }
            }
        }
    }
}
def call(Map config = [:]) {
    loadLinuxScript(name: 'download_artifacts.sh')
    sh "./download_artifacts.sh ${config.GitRepository} ${config.DestinationPath}"
}

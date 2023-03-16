def call(Map config = [:]) {
    loadLinuxScript(name: 'store_artifacts.sh')
    sh "./store_artifacts.sh ${config.GitRepository} ${config.DestinationPath}"
}

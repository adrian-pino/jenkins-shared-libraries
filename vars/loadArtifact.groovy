def call(Map config = [:]) {
    loadLinuxScript(name: 'load_artifact.sh')
    sh "./load_artifact.sh ${config.GitRepository} ${config.File}"
}

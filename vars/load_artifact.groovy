def call(Map config = [:]) {
    loadLinuxScript(name: 'load_artifacts.sh')
    sh "./load_artifacts.sh ${config.GitRepo} ${config.File}"
}

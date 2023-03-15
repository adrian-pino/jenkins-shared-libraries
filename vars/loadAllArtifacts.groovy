def call(Map config = [:]) {
    loadLinuxScript(name: 'load_all_artifacts.sh')
    sh "./load_all_artifacts.sh ${config.GitRepository} ${config.File}"
}

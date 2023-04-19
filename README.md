# Jenkins shared libraries
The objective of this repository is to implement the scripts needed to store/load Jenkins lightweight artifacts in another Git repository.



## Structure

Directory structure: 
```
.
├── README.md
├── pipeline
│   └── functionality-testing-pipeline.yaml
├── resources
│   └── scripts
│       ├── download_artifacts.sh
│       └── store_artifacts.sh
└── vars
    ├── downloadArtifacts.groovy
    ├── loadLinuxScript.groovy
    └── storeArtifacts.groovy
```

## Pre-requisites
### Authorization to manage the Git repository storing the artifacts. 
The jenkins worker need to have fixed the authorization in order to manage the Git repository. This can be done i) adding the jenkins-worker's public-ssh key to the Git repository (a ssh key-pair gets generated at instantiation time), or ii) making use of an unique ssh key-pair. Thus, the private-ssh key would be added to the worker(s) at instantiation time, and the public-key would be already added in Git.

## Usage
1. Create a Jenkins Global Pipeline Library. A shared library that maps this repository will be created. A mapping between the Global Pipeline Library (also called shared library) and the git repository location will be implemented. (E.g: Name: goat-jenkins-shared-libraries, Default version: master, Project Repository: https://github.com/adrian-pino/jenkins-shared-libraries).
1. Add the shared library to the Jenkins pipeline. At this point any script located under /scripts could be used in the pipeline.
1. An example of a pipeline storing/downloading artifacts ir provided under /pipeline

## Functionality supported
### Download Artifacts
```
@Library("goat-jenkins-shared-libraries") _
pipeline {
    agent any

    stages {
        stage('Download artifacts') {
            steps {
                downloadArtifacts(GitRepository:"$GIT_REPO", ArtifactsLocationPath:"$PATH")
            }
        }
    }
}
```
### Store Artifacts
```
@Library("goat-jenkins-shared-libraries") _
pipeline {
    agent any

    stages {
        stage('Store artifacts') {
            steps {
                storeArtifacts(GitRepository:"$GIT_REPO", DestinationPath:"$PATH")
            }
        }
    }
}
```


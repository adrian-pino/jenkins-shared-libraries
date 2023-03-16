# Jenkins shared libraries
The objective of this repository is to implement the scripts needed to store/load Jenkins lightweight artifacts in another Git repository.

## Structure

Directory structure: 
```
.
├── README.md
├── resources
│   └── scripts
│       ├── download_artifacts.sh
│       └── store_artifacts.sh
└── vars
    ├── downloadArtifacts.groovy
    ├── loadLinuxScript.groovy
    └── storeArtifacts.groovy
```

## Usage
1. Create a Jenkins Global Pipeline Library. A shared library that maps this repository will be created. A mapping between the Global Pipeline Library (also called shared library) and the git repository location will be implemented.
1. Add the shared library to the Jenkins pipeline. At this point any script located under /scripts could be used in the pipeline.


# Functionality supported
1. Download Artifacts
```
@Library("geant-goat-shared-library") _
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
1. Store Artifacts
```
@Library("geant-goat-shared-library") _
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




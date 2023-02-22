# Jenkins shared libraries
The objective of this repository is to implement the scripts needed to store/load Jenkins lightweight artifacts in another Git repository.

## Structure

Directory structure: 
```
.
├── README.md
├── resources
│   └── scripts
│       ├── load_artifacts.sh
│       └── upload_artifacts.sh
└── vars
    ├── loadArtifacts.groovy
    └── loadLinuxScript.groovy
```


## Usage
1. Create a Jenkins Global Pipeline Library. A shared library that maps this repository will be created. A mapping between the Global Pipeline Library (also called shared library) and the git repository location will be implemented.
1. Add the shared library to the Jenkins pipeline. At this point any script located under /scripts could be used in the pipeline.
```
@Library("gap-shared-library") _
pipeline {
    agent any

    stages {
        stage('Load artifact') {
            steps {
                load_artifacts(GitRepo:"$GIT_REPO", File:"$FILE")
            }
        }
    }
}
```



node {
    stage('Checkout') {
      echo "Checkout code in progress...."
      checkout scm
    }


    stage('Build') {
    echo "Building in progress...."
    def mavenHome = tool name: 'LocalMaven'
	if(isUnix()){
	  sh "${mavenHome}/bin/mvn clean install"
	}
    }

     stage('Create image') {
	     def newApp
	     def registry = 'registry.hub.docker.com'
	     def registryCredential = 'swe645group'
	     def buildHome = 'swe645group/swe645_restbackend'
		docker.withRegistry( 'https://' + registry, registryCredential ) {
			    def buildName = buildHome + ":$BUILD_NUMBER"
				newApp = docker.build buildName
				newApp.push()
				buildName = buildHome + ":latest"
				newApp = docker.build buildName
				newApp.push()
    	}
    }
}
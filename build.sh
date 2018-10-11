if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master'  ||  ${TRAVIS_BRANCH} = 'develop' ]]; then
    echo 'Checking Quality Gates'
    mvn -B clean verify sonar:sonar  
    -Dsonar.host.url=https://sonarcloud.io 
    -Dsonar.projectKey=citestsonar 
    -Dsonar.organization=jzouhair-github 
    -Dsonar.login=${SONAR_LOGIN};
    elif [ ${TRAVIS_PULL_REQUEST} != 'false' ]; then
    echo 'Build and analyze pull request'
    mvn -B clean verify sonar:sonar
     -Dsonar.host.url=https://sonarcloud.io 
    -Dsonar.projectKey=citestsonar 
    -Dsonar.organization=jzouhair-github 
     -Dsonar.login=${SONAR_LOGIN} 
     -Dsonar.pullrequest.github.repository=marocraft/CI_Test
     -Dsonar.pullrequest.provider=GitHub 
     -Dsonar.pullrequest.branch=${TRAVIS_BRANCH} 
     -Dsonar.pullrequest.key=${TRAVIS_PULL_REQUEST};
fi
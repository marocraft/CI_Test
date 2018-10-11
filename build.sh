if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master'  ||  ${TRAVIS_BRANCH} = 'develop' ]]; then
    echo 'Checking Quality Gates'
    mvn -B clean verify sonar:sonar  -Dsonar.host.url=https://sonarcloud.io -Dsonar.projectKey=citestsonar -Dsonar.organization=jzouhair-github -Dsonar.login=ce12a062054fee67e740a2458bea3178ae439b9d;
fi
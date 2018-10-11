
    mvn -B clean verify sonar:sonar -Dsonar.host.url=https://sonarcloud.io -Dsonar.projectKey=citestsonar -Dsonar.organization=jzouhair-github -Dsonar.login=${SONAR_LOGIN};


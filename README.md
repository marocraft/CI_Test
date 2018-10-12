# les étapes de CI avec Travis

## Link Github to Travis :

* Go to Travis-ci.com et connectez-vous avec GitHub.
* Accepter l'autorisation de the Travis CI.
* cliquer sur button Sync account, et selectionner votre rep.

![organizintravis](https://user-images.githubusercontent.com/42948484/46856294-e9ef6380-cdfd-11e8-923d-0e696382ccf0.PNG)

* ajouter dans votre rep le fichier .travis.yml.
![image2](https://user-images.githubusercontent.com/42948484/46856428-510d1800-cdfe-11e8-84d8-9ea26e33a514.png)
```
cache:
directories:
- $HOME/.m2
language: java
jdk:
Oraclejdk8
install:
- mvn -N io.takari:maven:wrapper
- ./mvnw install -DskipTests=true -Dmaven.javadoc.skip=true -B -V
services:
- mysql 

```
## Integrate SonarCloud Quality Gates :
* Go to Sonarcloud.io et connectez vous avec Github

![image6](https://user-images.githubusercontent.com/42948484/46857470-e9a49780-ce00-11e8-802b-f6dddba55469.png)

* cliquez sur button '+' et selectionner "Create new project"
* cliquer sur le lien "Install SonarCloud Github application", et selectionner votre rep.
* dans sonarcloud, selectionner votre projet et cliquer sur create.

![image5](https://user-images.githubusercontent.com/42948484/46857436-d1cd1380-ce00-11e8-8bc8-4bdea2161d67.png)

* changer votre travis.yml et ajouter la ligne suivante Edit your travis.yml :

```
script: ./build.sh

```
![image7](https://user-images.githubusercontent.com/42948484/46857743-8830f880-ce01-11e8-95d5-d4f1d9c7bbda.png)

* Ajoujet le fichier build.sh dans votre rep, mettre le script suivant :
```
if [ ${TRAVIS_PULL_REQUEST} = 'false' ] && [[ $TRAVIS_BRANCH = 'master' || ${TRAVIS_BRANCH} = 'develop' ]]; then
echo 'Checking Quality Gates'
mvn -B clean verify sonar:sonar\
-Dsonar.host.url=${SONAR_URL}\ 
-Dsonar.projectKey=${SONAR_PROJECT}\ 
-Dsonar.organization= ${SONAR_ORGANIZATION}\ 
-Dsonar.login==${SONAR_LOGIN} 
fi


```
### Remarque: il faut donner au fichier build.sh les droits d'acces 755
```
git update-index --add --chmod=+x build.sh
git commit -m 'Make build.sh executable'
git push

```
 #### voila le resultat dans SonarCloud

![sonarpassed](https://user-images.githubusercontent.com/42948484/46858307-ec07f100-ce02-11e8-8165-f2b97e628ba7.PNG)


![stat](https://user-images.githubusercontent.com/42948484/46858335-fe822a80-ce02-11e8-9e5c-142a2785446b.PNG)










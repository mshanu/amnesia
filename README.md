# amnesia
Toolssets you wouldnt want to install in machine but want it for short time
## Generate gradlew files
docker run -v $(pwd):/app mshanu/amnesia gradle wrapper 

## Generate yo
docker run -ti -v $(pwd):/app mshanu/amnesia yo generator-webapp

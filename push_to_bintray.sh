#!/bin/bash
#Sample Usage: pushToBintray.sh username apikey owner repo package version pathToP2Repo
API=https://api.bintray.com
BINTRAY_USER=$1
BINTRAY_API_KEY=$2
BINTRAY_OWNER=$3
BINTRAY_REPO=$4
PCK_NAME=$5
PCK_VERSION=$6
PATH_TO_REPOSITORY=$7

function main() {
deploy_updatesite
}

function deploy_updatesite() {
echo "${BINTRAY_USER}"
echo "${BINTRAY_API_KEY}"
echo "${BINTRAY_OWNER}"
echo "${BINTRAY_REPO}"
echo "${PCK_NAME}"
echo "${PCK_VERSION}"
echo "${PATH_TO_REPOSITORY}"

if [ ! -z "$PATH_TO_REPOSITORY" ]; then
   cd $PATH_TO_REPOSITORY
fi


FILES=./*

for f in $FILES;
do
if [ ! -d $f ]; then
  echo "Processing $f file..."
  if [[ "$f" == *content.jar ]] || [[ "$f" == *artifacts.jar ]] 
  then
    echo "Uploading p2 metadata file directly to the repository"
    curl -X PUT -T $f -u ${BINTRAY_USER}:${BINTRAY_API_KEY} https://api.bintray.com/content/${BINTRAY_OWNER}/${BINTRAY_REPO}/$f;publish=0
  else 
    curl -X PUT -T $f -u ${BINTRAY_USER}:${BINTRAY_API_KEY} https://api.bintray.com/content/${BINTRAY_OWNER}/${BINTRAY_REPO}/${PCK_NAME}/${PCK_VERSION}/$f;publish=0
  fi
  echo ""
fi
done

}


main "$@"
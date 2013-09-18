#!/bin/sh

JETTY_VERSION="7.6.13.v20130916"

cd $OPENSHIFT_DATA_DIR

if [ -d "jetty" ] && [ "`cat jetty/VERSION`" == $JETTY_VERSION ]; then

  echo "Jetty already installed"

else

  echo "Installing Jetty ${JETTY_VERSION}"

  if [ -d "jetty" ]; then
    rm -rf jetty
  fi

  curl -o jetty.tar.gz "http://eclipse.org/downloads/download.php?file=/jetty/stable-7/dist/jetty-distribution--${JETTY_VERSION}.tar.gz&r=1"

  tar -xf jetty.tar.gz
  rm jetty.tar.gz

  mv jetty-distribution-${JETTY_VERSION} jetty

  echo $JETTY_VERSION > jetty/VERSION

  rm -rf jetty/contexts/*
  rm -rf jetty/webapps


  curl -o maven.xml "https://github.com/venambati/jetty-openshift-quickstart/master/maven.xml"

fi

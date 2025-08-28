#!/usr/bin/env bash

##############################################################################
##
##  Gradle wrapper (Termux Compatibility Fix)
##
##############################################################################

# Simple error handling function for Termux compatibility
die() {
    echo "ERROR: $1" >&2
    exit 1
}

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
        # IBM\"s JDK on AIX uses strange locations for the executables
        JAVACMD="$JAVA_HOME/jre/sh/java"
    else
        JAVACMD="$JAVA_HOME/bin/java"
    fi
    if [ ! -x "$JAVACMD" ] ; then
        die "JAVA_HOME is set to an invalid directory: $JAVA_HOME\\n\\nPlease set the JAVA_HOME environment variable in your environment to match the\\nlocation of your Java installation."
    fi
else
    JAVACMD="java"
    which java >/dev/null 2>&1 || die "JAVA_HOME is not set and no \"java\" command could be found in your PATH.\\n\\nPlease set the JAVA_HOME environment variable in your environment to match the\\nlocation of your Java installation."
fi

# Determine the script directory.
SCRIPT_DIR=$(dirname "$0")

# Add default JVM options for the Gradle daemon. These can be overridden by the user.
DEFAULT_JVM_OPTS="-Xmx1024m -Dfile.encoding=UTF-8"

# Set the Gradle distribution URL.
GRADLE_DISTRIBUTION_URL="https://services.gradle.org/distributions/gradle-8.2-bin.zip"

# Set the Gradle version.
GRADLE_VERSION="8.2"

# Set the Gradle user home directory.
# Use a relative path for Termux compatibility
GRADLE_USER_HOME="$HOME/.gradle"

# Set the Gradle wrapper properties file.
GRADLE_WRAPPER_PROPERTIES="$SCRIPT_DIR/gradle/wrapper/gradle-wrapper.properties"

# Create the Gradle wrapper properties file if it doesn\"t exist.
# Ensure this path is relative to SCRIPT_DIR
mkdir -p "$SCRIPT_DIR/gradle/wrapper"
if [ ! -f "$GRADLE_WRAPPER_PROPERTIES" ] ; then
    cat > "$GRADLE_WRAPPER_PROPERTIES" << EOF_INNER
#Fri Mar 18 00:00:00 UTC 2025
distributionBase=GRADLE_USER_HOME
distributionPath=wrapper/dists
distributionUrl=$GRADLE_DISTRIBUTION_URL
zipStoreBase=GRADLE_USER_HOME
zipStorePath=wrapper/dists
EOF_INNER
fi

# Execute the Gradle wrapper.
# This part might still fail if Java is not correctly set up or if the wrapper JAR is missing.
exec "$JAVACMD" -jar "$SCRIPT_DIR/gradle/wrapper/gradle-wrapper.jar" "$@"

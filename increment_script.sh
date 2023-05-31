#!/bin/bash

set -e

actual_version=${INPUT_ACTUAL_VERSION}
release=${INPUT_LATEST_RELEASE}

echo "Actual version: ${actual_version}"
echo "Latest release: ${release}"

# Get number after last - in old_release
old_number=$(echo "${release}" | sed 's/.*-//')

echo "Old release number: ${old_number}"

# Increment old_release_number
new_release_number=$((old_number + 1))

# New final version
new_version="${actual_version}-beta-${new_release_number}"

# Set new version in pom.xml
mvn versions:set -DnewVersion="${new_version}"

# Output new version to GitHub Actions
echo "::set-output name=new_version::${new_version}"
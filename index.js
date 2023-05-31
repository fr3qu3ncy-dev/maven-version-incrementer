const core = require('@actions/core');
const execSync = require('child_process').execSync;

try {
    const actualVersion = core.getInput('actual_version');
    const latestRelease = core.getInput('latest_release');

    console.log(`Actual version: ${actualVersion}`);
    console.log(`Latest release: ${latestRelease}`);

    // Get number after last "-" in latestRelease and parse it to int
    let oldNumber = parseInt(latestRelease.substring(latestRelease.lastIndexOf("-") + 1));
    if (isNaN(oldNumber)) {
        oldNumber = 0;
    }

    console.log(`Old number: ${oldNumber}`)

    // Increment oldNumber
    const newNumber = oldNumber + 1;

    const newVersion = actualVersion + "-beta-" + newNumber;

    // Set new version in pom.xml
    execSync('mvn versions:set -DnewVersion=${newVersion} -DgenerateBackupPoms=false');

    core.setOutput("new_version", newVersion);

    console.log(`Set new version to: ${newVersion}`);
} catch (error) {
    core.setFailed(error.message);
}
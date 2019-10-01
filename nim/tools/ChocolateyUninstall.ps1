# File:          ChocolateyUninstall.ps1
# Description:   Un-installation of the Nim programming language
# Author:        Arthur Zubarev
# Email:         arthurz at gmx dot com
# Revision:      0.0.2
# Last Modified: Tue Oct 01 2019 12:20 PM UTC

$ErrorActionPreference = 'Stop';

Uninstall-ChocolateyZipPackage 'nim'

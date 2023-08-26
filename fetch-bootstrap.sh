#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# Fetch latest bootstrap, and places files into our git working copy.
#

#set -x

VERSION="5.3.1"
DIST="bootstrap-${VERSION}-dist"
B_URL="https://github.com/twbs/bootstrap/releases/download/v${VERSION}/${DIST}.zip"

THIS_DIR=$(/bin/dirname "`realpath $0`")
C_DIR="${THIS_DIR}/content"

ZIPFILE="${THIS_DIR}/bs.zip"

echo "Fetching: ${B_URL}"
curl -q --location "${B_URL}" --output "${ZIPFILE}"

echo "Extracting: bootstrap.min.css"
unzip -joq "${ZIPFILE}" "${DIST}/css/bootstrap.min.css" -d "${C_DIR}/css"
echo "Extracting: bootstrap.min.css.map"
unzip -joq "${ZIPFILE}" "${DIST}/css/bootstrap.min.css.map" -d "${C_DIR}/css"
echo "Extracting: bootstrap.bundle.min.js"
unzip -joq "${ZIPFILE}" "${DIST}/js/bootstrap.bundle.min.js" -d "${C_DIR}/js"
echo "Extracting: bootstrap.bundle.min.js.map"
unzip -joq "${ZIPFILE}" "${DIST}/js/bootstrap.bundle.min.js.map" -d "${C_DIR}/js"

echo "NOTE: zip can now be removed: ${ZIPFILE}"

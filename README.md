# GitHub Action - Hugo and Firebase

Based on https://github.com/pulimento/github-action-hugo-deploy-to-firebase

This GitHub action build a [Hugo](https://gohugo.io) site, and uploads it to [Firebase Hosting](https://firebase.google.com/docs/hosting/)
It needs a Firebase token. You can obtain it installing [firebase-tools](https://github.com/firebase/firebase-tools) and doing `firebase login-ci`.

Store the Firebase token as FIREBASE_TOKEN under [GitHub secrets](https://help.github.com/es/articles/virtual-environments-for-github-actions#naming-conventions)

A simple workload using this action would be something like:

**hugo2firebase.yml**

````  
on: [push]
name: Publish the changes
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v2
      with:
        submodules: true
    - uses: fatyogi/github-action-hugo2firebase@master
      with:
        firebase-token: ${{ secrets.FIREBASE_TOKEN }}
````


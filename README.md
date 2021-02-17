This GitHub Action offers you a way to run reckoner commands within your Github Acitons workflows

## Features

- Run reckoner commands


## Supported Operating Systems

- Linux


## Getting Started


```yaml
name: CI
on: [push]
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v1
    - name: Reckoner Lint
      uses: apex-crypto/reckoner-action@v1
      with: 
        'reckoner lint reckoner/course.yml'
```
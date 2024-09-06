# Template Angular Lib

## Introduction

This repository serves as a base template for all Angular libraries in our organization. The template is designed to follow best practices for Angular development, ensuring consistency, scalability, and maintainability across all projects. It includes predefined configurations, structures, and tools to simplify the project setup and speed up development.

## Features

- **Modular Architecture**: Encourages a scalable and maintainable codebase.
- **SCSS Support**: Preconfigured for writing styles in SCSS.
- **Linting and Formatting**: Integrated ESLint and Prettier for code quality.
- **Testing**: Configured for unit tests using Karma and Jasmine.
- **CI/CD Ready**: Includes configurations for continuous integration pipelines.
- **Sync Scripts**: Includes scripts for synchronizing with remote repositories.
- **Git Flow Checks**: Implements checks to ensure adherence to Git Flow workflows.

## Getting Started

### Prerequisites

To work with this template, ensure that you have the following installed:

- [Node.js](https://nodejs.org/)
- [Angular CLI](https://angular.dev/tools/cli)
- [Git](https://git-scm.com/)

### Installation

1.Clone the repository:

```bash
git clone git@bitbucket.org:sea-code-labs/angular-template.git

cd angular-template
```

2.Install the project dependencies:

```bash
npm install

npm run husky:setup

npm run scripts:grant:access
```

### Default Project Structure

```text
template-angular-lib/
├── .husky
│   ├── commit-msg
│   ├── pre-commit
├── node_modules
├── projects
│   ├── libs
├── scripts
│   ├── build-libs.js
│   ├── create-lib.js
│   ├── git-sync.sh
├── .browserslistrc
├── .editorconfig
├── .gitignore
├── .lintstagedrc
├── .prettierrc
├── angular.json
├── bitbucket-pipelines.yml
├── commitlint.config.ts
├── eslint.config.mjs
├── husky-mod.js
├── karma.conf.js
├── package.json
├── package-lock.json
├── README.md
├── tsconfig.app.json
├── tsconfig.eslint.json
├── tsconfig.json
├── tsconfig.spec.json
```

### Configuration

1. Change project name.

2. Configure pipeline scripts based on project platform and needs.

3. Configure package.json scripts based on project needs.

4. Configure linting rules, prettier and husky hooks in husky-mod based on project needs.

### Additional Instructions

1. You can create library directly in projects folders
   with already connected karma config using this script:

```
npm run ng:lib [lib-name]
```

2. You can format (lint all files) your code in project files with this script:

```
npm run format
```

3. You can check and rebuild your libraries (package.json / package-lock.json / node_modules)
   with this script:

```
npm run npm:rebuild
```

4. You can sync your local repository state with remote using this script
   (we recommend to checkout to local main branch first):

```
npm run sync
```

### Development

For detailed information about development flow,
visit [development documentation](https://seacodelabs.atlassian.net/wiki/external/N2UwY2NiYzBiNGVjNDkwZGFkNjFhZDgyZTFjNTBkMjg).

**@sea-code-labs**

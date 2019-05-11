# Purescript Concur Bootstrap

Bootstrap components for Purescript-Concur (React backend)

## Usage

### Option 1. Use spago to install (TODO)

> spago install concur-react-bootstrap

### Option 2: Use bower to install (TODO)

> bower install concur-react-bootstrap

### Option 3: Build manually

#### Grab the code

> git clone https://github.com/ajnsit/purescript-concur-bootstrap.git

##### Build code

> npm install

> npm run build

#### Run Dev Server

> npm start

#### Hot code reload with purescript code

At the end of the previous command, you will have a development server
which will watch for changes, and automatically reload the web page.
This mechanism only works with JS changes.

However, in practice, your IDE should automatically recompile Purescript to
Javascript on every change, which will be picked up by the development server.
So you get immediate recompilation even with Purescript.

#### Build production artifacts

> npm run prod

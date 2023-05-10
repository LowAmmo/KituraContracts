# Internal Oracle Cerner Repo

This is an internal copy/fork of the public repo from github.com - https://github.com/Kitura/KituraContracts

The goal/hope is that this is a temporary fork while waiting for the main repo to make necessary/required updates to continue building with the latest/newest build tools.

## Process

To update/contribute to this repo, the process is shortened - and relying on true testing taking place via the consuming components / applications.

### Contributing

To contribute / update the repo, submit Pull Requests onto the `cerner-main` branch.

### Branching

##### Security

The official branches are locked down just to prevent accidental modifications. Any changes done to cerner-release will require modifying the Settings for this repo to remove restrictions on the branch. Please make sure to reapply the restrictions when done.

#### `cerner-main`

Our "custom" code that goes ontop of the official code from the primary code repository.

#### `cerner-release`

When this branch is pushed / updated, a new "release" is published to the internal cocoapod spec repo.

**Make sure to tag each published version**

_ONLY PUSH/MODIFY THIS BRANCH WHEN RELEASING A NEW VERSION OF THIS COMPONENT_

### Versioning

Each 'custom' version should append `-cerner` to indicate it's a "cerner only" release in our internal cocoapod spec repo.

Version the base version with the correlating version from the original public repo.

#### Example

If the base public release is `1.2.3`, the internal release that addresses the necessary issue(s) would be `1.2.3-cerner`.

Subsequent Cerner releases on the same version would append a version number after the `-cerner` postfix: `1.2.3-cerner3`, etc.

### Tagging

When releasing a new version, make sure to do a github Release describing the changes in the release, etc.


#### New Public Version Released

If the main repo publishes a new release, that does not address the necessary changes to stop using this internal version, an updated internal release should be done.

1. Do a hard reset of the `cerner-main` branch to the new base release of the original repo (could be to `main` or `master` or to a version tagged commit)
2. Cherry-pick applicable commits from the old `cerner-main`
3. If any changes to the old commits are necessary, do a new Pull Request onto `cerner-main` INSTEAD OF cherry-picking

In general, every internal release should contain at least 3 commits:

1. Initial commit preparing the internal version of the repo:
  * These updates to the README.md
  * Pull Request Template
  * Jenkinsfile
  * Podspec updates to point to this repo (if necessary)
2. Necessary changes to fix issues or enable building, etc.
3. Setting the vew version to publish

Keeping each commit separate increases the odds that just cherry picking will work for future updates (except for the new version setting).

&nbsp;


# -- Original README.md From Public Repo --

&nbsp;

&nbsp;


<p align="center">
<a href="https://www.kitura.io/">
<img src="https://raw.githubusercontent.com/Kitura/Kitura/master/Sources/Kitura/resources/kitura-bird.svg?sanitize=true" height="100" alt="Kitura">
</a>
</p>


<p align="center">
<a href="https://kitura.github.io/KituraContracts/index.html">
<img src="https://img.shields.io/badge/apidoc-KituraContracts-1FBCE4.svg?style=flat" alt="APIDoc">
</a>
<a href="https://travis-ci.org/Kitura/KituraContracts">
<img src="https://travis-ci.org/Kitura/KituraContracts.svg?branch=master" alt="Build Status - Master">
</a>
<img src="https://img.shields.io/badge/os-macOS-green.svg?style=flat" alt="macOS">
<img src="https://img.shields.io/badge/os-linux-green.svg?style=flat" alt="Linux">
<img src="https://img.shields.io/badge/license-Apache2-blue.svg?style=flat" alt="Apache 2">
<a href="http://swift-at-ibm-slack.mybluemix.net/">
<img src="http://swift-at-ibm-slack.mybluemix.net/badge.svg" alt="Slack Status">
</a>
</p>

# KituraContracts

## Summary

KituraContracts is a library containing type definitions shared by client (e.g. [KituraKit](https://kitura.github.io/KituraKit/)) and server (e.g. [Kitura](https://kitura.github.io/Kitura)) code. These shared type definitions include [Codable Closure Aliases](https://kitura.github.io/KituraContracts/Typealiases.html), [RequestError](https://kitura.github.io/KituraContracts/Structs/RequestError.html), [QueryEncoder](https://kitura.github.io/KituraContracts/Classes/QueryEncoder.html), [QueryDecoder](https://kitura.github.io/KituraContracts/Classes/QueryDecoder.html), [Coder](https://kitura.github.io/KituraContracts/Classes/Coder.html), [Identifier Protocol](https://kitura.github.io/KituraContracts/Protocols/Identifier.html#/s:15KituraContracts10IdentifierP5valueSSv) and [Extensions](https://kitura.github.io/KituraContracts/Extensions.html#/s:SS) to String and Int, which add conformity to the Identifier protocol.

## Usage

KituraContracts represents the types and protocols that are common to both the [Kitura](https://github.com/Kitura/Kitura) server and [KituraKit](https://github.com/Kitura/KituraKit) client side library. If you are using Kitura or KituraKit, your project does not need to depend on KituraContracts explicitly.

#### Add dependencies

Add the `KituraContracts` package to the dependencies within your application’s `Package.swift` file. Substitute `"x.x.x"` with the latest `KituraContracts` [release](https://github.com/Kitura/KituraContracts/releases).

```swift
.package(url: "https://github.com/Kitura/KituraContracts.git", from: "x.x.x")
```

Add `KituraContracts` to your target's dependencies:

```swift
.target(name: "example", dependencies: ["KituraContracts"]),
```

#### Import package

```swift
import KituraContracts
```

## Example

This example, shows how to use a shared type definition for `RequestError` within a router POST method on `users`. If no errors occurred and you have a `User` you can respond with the user and pass nil as the `RequestError?` value. If there has been an error you can respond with an appropriate error and pass nil for the `User?`.

````swift
public struct User: Codable {
    ...
}

router.post("/users") { (user: User, respondWith: (User?, RequestError?) -> Void) in

    if databaseConnectionIsOk {
        ...
        respondWith(user, nil)
    } else {
        ...
        respondWith(nil, .internalServerError)
    }
}
````

## Swift version

The 1.x.x releases were tested on macOS and Linux using the Swift 4.1 binaries. Please note that this is the default version of Swift that is included in [Xcode 9.3](https://developer.apple.com/xcode/).

## API Documentation
For more information visit our [API reference](https://kitura.github.io/KituraContracts/index.html).

## Community

We love to talk server-side Swift and Kitura. Join our [Slack](http://swift-at-ibm-slack.mybluemix.net/) to meet the team!

## License

This library is licensed under Apache 2.0. Full license text is available in [LICENSE](https://github.com/Kitura/KituraContracts/blob/master/LICENSE).

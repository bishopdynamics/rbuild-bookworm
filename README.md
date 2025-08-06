# rbuild - Radxa Image Builder

I wanted some images using Debian Bookworm for RockPi 4A and 4C, so I made tweaks to rbuild to make it work.

Prebuilt images are available in [Releases](https://github.com/bishopdynamics/rbuild-bookworm/releases), they have NOT been thoroughly tested.

The log from the most recent release build can be found in [build.log](./build.log).

Github actions were removed, see [original repo](https://github.com/radxa-repo/rbuild).

## Original Readme below

[![Build](https://github.com/radxa-repo/rbuild/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/radxa-repo/rbuild/actions/workflows/build.yaml)

After more than 2 years of development, we have grown beyond what `rbuild`'s underlying dependencies are capable of.
We have switched to a [lower-level tool](https://github.com/bdrung/bdebstrap) and completely restructured the project.

Please use [`rsdk`](https://github.com/RadxaOS-SDK/rsdk) for the new project, which is meant to be compatible with
existing `rbuild` systems. `rbuild` is now in maintenance mode.

## Usage

### Local

Please run the following command to check all available options:

```
git clone --depth 1 https://github.com/radxa-repo/rbuild.git
rbuild/rbuild
```

You can then build the image with supported options. The resulting image will be stored in your current directory.

### Running in GitHub Action

Please check out our [GitHub workflows](https://github.com/radxa-repo/rbuild/tree/main/.github/workflows).

## Default image configuration

- Default user and password are all `radxa`
- Default user is in `sudo` group
- SSH is disabled by default to prevent unauthorized access. Host key will be generated at first boot.
- First boot will expand the system partition to fill the storage media

Please check out the [first boot configuration script](https://github.com/radxa-repo/rbuild/tree/main/common/overlays/common/config/before.txt).

## Documentation

Please visit [Radxa Documentation](https://radxa-doc.github.io/).

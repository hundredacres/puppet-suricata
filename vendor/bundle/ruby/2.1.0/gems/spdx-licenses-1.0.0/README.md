# spdx-licenses

A Ruby library around the [SPDX license data](http://spdx.org/licenses/),
which provides a set of standard identifiers for open source licenses.

The data is maintained by [SPDX](http://spdx.org) and this library
redistributes a JSON file of data generated in the
[spdx-license-list](https://github.com/sindresorhus/spdx-license-list)
project.

## Installation

    $ gem install spdx-licenses

or in your Gemfile:

    gem 'spdx-licenses'

## Versioning

This gem and its API is versioned according to semver.  Minor releases may
contain updates to the SPDX License List data.

| spdx-licenses | SPDX License List |
|---------------|-------------------|
| 1.0.0         | 1.2.0             |

## Usage

    > lic = SpdxLicenses.lookup('Apache-2.0')
    > lic.id
    "Apache-2.0"
    > lic.name
    "Apache License 2.0"
    > lic.osi_approved?
    true
    > SpdxLicenses.lookup('Unknown')
    nil

    > SpdxLicenses.exist?('Apache-2.0')
    true
    > SpdxLicenses.exist?('Unknown')
    false

## License

Copyright (c) 2014 Dominic Cleal.  Distributed under the MIT license.

Except for spdx.json which is redistributed under MIT from
[spdx-license-list](https://github.com/sindresorhus/spdx-license-list).

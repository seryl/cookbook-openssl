openssl
=======

Providers allow generation of x509 certificates.

Library provides a method to generate secure passwords for use in recipes.

Usage
-----

Most often this will be used to generate a secure password for an attribute.

    include Opscode::OpenSSL::Password

    set_unless[:my_password] = secure_password

### Author

Josh Toft <joshtoft@gmail.com>

Includes *secure_password* by Joshua Timberman <joshua@opscode.com>

### License

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

maintainer        "Opscode, Inc."
maintainer_email  "cookbooks@opscode.com"
license           "Apache 2.0"
description       "Installs Python, pip and virtualenv. Includes LWRPs for managing Python packages with `pip` and `virtualenv` isolated Python environments."
version           "1.0.6"

depends           "build-essential"

recipe "python", "Installs python, pip, and virtualenv"
recipe "python::package", "Installs python using packages."
recipe "python::source", "Installs python from source."
recipe "python::pip", "Installs pip from source."
recipe "python::virtualenv", "Installs virtualenv using the python_pip resource."

%w{ debian ubuntu centos redhat fedora freebsd }.each do |os|
  supports os
end

install_methods = [
    "package",
    "source"
]

attribute "python/install_method",
    :display_name => "Install Method",
    :description => "The method to use when installing Python.",
    :required => "required",
    :choice => install_methods,
    :recipes => ["python::default"]

grouping "python/pip",
    :title => "PIP Install Settings",
    :description => "Inputs for PIP install."

attribute "python/pip/py_version",
    :display_name => "PIP Settings",
    :description => "The version of Python to use when installing PIP.",
    :required => "recommended",
    :default => "",
    :recipes => ["python::pip"]

grouping "python/source",
    :title => "Python Source Install Settings",
    :description => "Settings to be used when installing Python from source."

attribute "python/source/url",
    :display_name => "Source URL",
    :description => "The base URL to download Python from.",
    :required => "optional",
    :default => "http://www.python.org/ftp/python",
    :recipes => ["python::source"]

attribute "python/source/version",
    :display_name => "Source Version",
    :description => "The Python version to install. Specify using 2.7.3 format. Defaults to 2.7.3.",
    :required => "optional",
    :default => "2.7.3",
    :recipes => ["python::source"]

attribute "python/source/checksum",
    :display_name => "Source Checksum",
    :description => "The MD5 checksum of the specified Python source version.",
    :required => "optional",
    :default => "c57477edd6d18bd9eeca2f21add73919",
    :recipes => ["python::source"]

attribute "python/source/prefix_dir",
    :display_name => "Source Prefix Directory",
    :description => "The path under which the specified version of Python should be installed.",
    :required => "optional",
    :default => "/usr/local",
    :recipes => ["python::source"]
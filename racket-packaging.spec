Name:		racket-packaging
Version:	1
Release:	1%{?dist}
Summary:	RPM utilities for Racket packaging

Group:		Development/Tools
License:	MIT
URL:		http://github.com/mordae/racket-packaging
Source0:	%{name}-%{version}.tar.gz

BuildArch:	noarch
Requires:	racket

%description
This package contains RPM utilities the automatically detect
dependencies of built Racket packages.


%prep
%setup -q

%build
make %{?_smp_mflags}

%install
make install DESTDIR="${RPM_BUILD_ROOT}"

%clean
rm -rf "${RPM_BUILD_ROOT}"

%files
%{_rpmconfigdir}/racket.*
%{_rpmconfigdir}/fileattrs/racket.*

%changelog
* Tue Aug 19 2014 Jan Dvorak <mordae@anilinux.org> - 1-1
- Package created.


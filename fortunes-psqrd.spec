Name:     fortunes-psqrd
Version:  0.2
Release:  1%{?dist}
Summary:  Fortunes
Vendor:   Peter F. Peterson

License:       Public Domain
URL:           http://www.github.com/peterfpeterson/fortunes
BuildArch:     noarch
Source0:       http://www.github.com/peterfpeterson/fortunes/releases/download/v%{version}/%{name}-%{version}.tar.gz
BuildRequires: fortune-mod
Prefix:        /usr/share/games/fortune
Requires:      fortune-mod

%description


%prep
%setup -q


%build
%{!?make_build: %define make_build %{__make} %{?_smp_mflags}}
%make_build

%install
rm -rf $RPM_BUILD_ROOT
mkdir -p $RPM_BUILD_ROOT
%make_install

%clean
if [ -d $RPM_BUILD_ROOT ]; then rm -rf $RPM_BUILD_ROOT; fi
rm -rf $RPM_BUILD_DIR/%{name}-%{version}

%check
#ctest

%files
%defattr(-,root,root,-)
%{_prefix}
%doc

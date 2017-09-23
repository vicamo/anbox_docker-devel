# GENERATED FROM Dockerfile.template. DO NOT EDIT.
FROM buildpack-deps:stretch

RUN (echo "deb [trusted=yes] http://dl.bintray.com/vicamo/ppa stretch contrib" | \
		tee /etc/apt/sources.list.d/bintray.list) \
	&& apt-get update --quiet \
	&& apt-get install --no-install-recommends --yes --allow-unauthenticated \
		build-essential \
		cmake \
		cmake-data \
		dbus \
		debhelper \
		google-mock \
		libboost-dev \
		libboost-filesystem-dev \
		libboost-iostreams-dev \
		libboost-log-dev \
		libboost-program-options-dev \
		libboost-system-dev \
		libboost-test-dev \
		libboost-thread-dev \
		libcap-dev \
		libdbus-1-dev \
		libdbus-cpp-dev \
		libegl1-mesa-dev \
		libgles2-mesa-dev \
		libglib2.0-dev \
		libglm-dev \
		libgtest-dev \
		liblxc1 \
		libproperties-cpp-dev \
		libprotobuf-dev \
		libsdl2-dev \
		libsdl2-image-dev \
		lxc-dev \
		pkg-config \
		protobuf-compiler

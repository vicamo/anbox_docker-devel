FROM buildpack-deps:sid

RUN apt-get update --quiet \
	&& apt-get install --no-install-recommends --yes \
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
		libegl1-mesa-dev \
		libgles2-mesa-dev \
		libglib2.0-dev \
		libglm-dev \
		libgtest-dev \
		liblxc1 \
		libprotobuf-dev \
		libsdl2-dev \
		libsdl2-image-dev \
		lxc-dev \
		pkg-config \
		protobuf-compiler

ADD properties-cpp.patch /tmp/properties-cpp.patch
ADD process-cpp.patch /tmp/process-cpp.patch
ADD dbus-cpp.patch /tmp/dbus-cpp.patch

RUN { \
	set -xe; \
	apt-get install --no-install-recommends --yes \
		bzr \
		doxygen \
		fakeroot \
		google-mock \
		graphviz \
		libgtest-dev \
		lsb-release; \
	WORKDIR=$(mktemp -d); \
	\
	mkdir ${WORKDIR}/googletest; \
	cd ${WORKDIR}/googletest; \
	cmake /usr/src/googletest; \
	make -j $(nproc); \
	for lib in libgmock_main.a gtest/libgtest_main.a gtest/libgtest.a libgmock.a; do \
		cp ${WORKDIR}/googletest/googlemock/${lib} /usr/lib; \
	done; \
	\
	for project in properties-cpp process-cpp dbus-cpp; do \
		bzr branch --quiet lp:${project} ${WORKDIR}/${project}; \
		cd ${WORKDIR}/${project}; \
		cat /tmp/${project}.patch | patch -p1; \
		fakeroot debian/rules binary; \
		ls ${WORKDIR}/*.deb | grep -v -- -doc_ | grep -v -- -dbgsym_ | xargs dpkg -i; \
	done; \
	cd /; \
	ls ${WORKDIR}; \
	rm -rf ${WORKDIR}; \
}

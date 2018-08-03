#!/usr/bin/env bash
dir=$(dirname $(readlink -f $0))

apt-get install -y \
    libxcb-xtest0 \
&& ${dir}/install-deb-from-url.bash 'https://d11yldzmag5yn.cloudfront.net/prod/2.3.128305.0716/zoom_amd64.deb'

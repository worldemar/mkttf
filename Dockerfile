FROM ubuntu:24.04

# mkttf dependencies
RUN apt-get update && apt-get install -y \
    fontforge=1:20230101~dfsg-1.1build1 \
    potrace=1.16-2build1 \
    python3.12=3.12.3-1ubuntu0.5 \
    python3.12-venv=3.12.3-1ubuntu0.5 \
    python3-fontforge=1:20230101~dfsg-1.1build1 \
    imagemagick=8:6.9.12.98+dfsg1-5.2build2 \
    && rm -rf /var/lib/apt/lists/*

# mkbold / mkitalic
RUN apt-get update && apt-get install -y \
    git=1:2.43.0-1ubuntu7.2 \
    make=4.3-4.1build2 \
    gcc=4:13.2.0-7ubuntu1 \
    && rm -rf /var/lib/apt/lists/* \
    && git clone https://gitlab.com/unshumikan/mkbold-mkitalic \
    && make -C mkbold-mkitalic -j4 \
    && make -C mkbold-mkitalic install \
    && rm -rf mkbold-mkitalic

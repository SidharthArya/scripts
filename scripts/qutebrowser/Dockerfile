FROM archlinux
ENV LANG en_US.utf8
RUN useradd -m qutebrowser
RUN usermod -a -G video,audio qutebrowser
RUN pacman -Sy --noconfirm qutebrowser
ENV HOME /hom/qutebrowser
WORKDIR /home/qutebrowser
USER qutebrowser
CMD ["/usr/bin/qutebrowser", "--backend", "webengine"]

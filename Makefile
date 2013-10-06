.PHONY: all
all:
	tar zxf sh4twbox-usb-auto-0.5.1-target.tgz
	rm mnt_system/etc/init.d/*
	rm mnt_system/root/*
	cp -a target/* mnt_system/
	tar --numeric-owner --owner=0 --group=0 -c mnt_system | gzip -9 -c > target.tgz

.PHONY: clean
clean:
	rm -fR mnt_system

